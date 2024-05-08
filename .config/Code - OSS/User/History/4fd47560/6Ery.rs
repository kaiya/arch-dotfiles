use std::{collections::HashMap, fmt::Debug};

use futures_util::TryFutureExt;
use hftbacktest::{backtest::MultiAssetMultiExchangeBacktest, live::Bot, prelude::*};
use tracing::info;

pub fn gridtrading<Q, MD, I: Interface<Q, MD>>(
    hbt: &mut I,
    half_spread: f64,
    grid_interval: f64,
    skew: f64,
    order_qty: f64,
) -> Result<(), i64>
where
    Q: Sized + Clone,
    MD: MarketDepth,
    <I as Interface<Q, MD>>::Error: Debug,
{
    let grid_num = 20;
    let max_position = grid_num as f64 * order_qty;

    let tick_size = hbt.depth(0).tick_size() as f64;
    let price_prec = get_precision(tick_size as f32);

    // Running interval in nanoseconds
    while hbt.elapse(100_000_000).unwrap() {
        let depth = hbt.depth(0);
        let position = hbt.position(0);

        if depth.best_bid_tick() == INVALID_MIN || depth.best_ask_tick() == INVALID_MAX {
            // Market depth is incomplete.
            continue;
        }

        info!(
            time = hbt.current_timestamp(),
            bid = format!("{:.prec$}", depth.best_bid(), prec = price_prec),
            ask = format!("{:.prec$}", depth.best_ask(), prec = price_prec),
            position = position,
            "Run"
        );

        let mid_price = (depth.best_bid() + depth.best_ask()) as f64 / 2.0;

        let normalized_position = position / order_qty;

        let bid_depth = half_spread + skew * normalized_position;
        let ask_depth = half_spread - skew * normalized_position;

        let bid_price = (mid_price - bid_depth).min(depth.best_bid() as f64);
        let ask_price = (mid_price + ask_depth).max(depth.best_ask() as f64);

        let grid_interval = ((grid_interval / tick_size).round() * tick_size).max(tick_size);

        let mut bid_price = (bid_price / grid_interval).floor() * grid_interval;
        let mut ask_price = (ask_price / grid_interval).ceil() * grid_interval;

        //--------------------------------------------------------
        // Updates quotes

        hbt.clear_inactive_orders(Some(0));

        {
            let orders = hbt.orders(0);
            let mut new_bid_orders = HashMap::new();
            if position < max_position && bid_price.is_finite() {
                for i in 0..grid_num {
                    bid_price -= i as f64 * grid_interval;
                    let bid_price_tick = (bid_price / tick_size).round() as i64;

                    // order price in tick is used as order id.
                    new_bid_orders.insert(bid_price_tick, bid_price);
                }
            }
            // Cancels if an order is not in the new grid.
            let cancel_order_ids: Vec<i64> = orders
                .values()
                .filter(|order| {
                    order.side == Side::Buy
                        && order.cancellable()
                        && !new_bid_orders.contains_key(&order.order_id)
                })
                .map(|order| order.order_id)
                .collect();
            // Posts an order if it doesn't exist.
            let new_orders: Vec<(i64, f64)> = new_bid_orders
                .into_iter()
                .filter(|(order_id, _)| !orders.contains_key(&order_id))
                .map(|v| v)
                .collect();
            for order_id in cancel_order_ids {
                hbt.cancel(0, order_id, false).unwrap();
            }
            for (order_id, order_price) in new_orders {
                hbt.submit_buy_order(
                    0,
                    order_id,
                    order_price as f32,
                    order_qty as f32,
                    TimeInForce::GTX,
                    OrdType::Limit,
                    false,
                )
                .unwrap();
            }
        }

        {
            let orders = hbt.orders(0);
            let mut new_ask_orders = HashMap::new();
            if position > -max_position && ask_price.is_finite() {
                for i in 0..grid_num {
                    ask_price += i as f64 * grid_interval;
                    let ask_price_tick = (ask_price / tick_size).round() as i64;

                    // order price in tick is used as order id.
                    new_ask_orders.insert(ask_price_tick, ask_price);
                }
            }
            // Cancels if an order is not in the new grid.
            let cancel_order_ids: Vec<i64> = orders
                .values()                .filter(|order| {
                    order.side == Side::Sell
                        && order.cancellable()
                        && !new_ask_orders.contains_key(&order.order_id)
                })
                .map(|order| order.order_id)
                .collect();
            // Posts an order if it doesn't exist.
            let new_orders: Vec<(i64, f64)> = new_ask_orders
                .into_iter()
                .filter(|(order_id, _)| !orders.contains_key(&order_id))
                .map(|v| v)
                .collect();
            for order_id in cancel_order_ids {
                hbt.cancel(0, order_id, false).unwrap();
            }
            for (order_id, order_price) in new_orders {
                hbt.submit_sell_order(
                    0,
                    order_id,
                    order_price as f32,
                    order_qty as f32,
                    TimeInForce::GTX,
                    OrdType::Limit,
                    false,
                )
                .unwrap();
            }
        }
    }
    Ok(())
}

fn main(){
    let mut hbt = MultiAssetMultiExchangeBacktest::builder().add(asset).unwrap_or_else();
    let mut hbt = Bot::builder().build();
     gridtrading(hbt, half_spread, grid_interval, skew, order_qty);
}
