# docker-create
# Autogenerated from man page /usr/share/man/man1/docker-create.1.gz
complete -c docker-create -l add-host -d '	Add a custom host-to-IP mapping (host:ip)'
complete -c docker-create -l annotation -d '	Add an annotation to the container (passed through to the OCI runtime)'
complete -c docker-create -s a -l attach -d '	Attach to STDIN, STDOUT or STDERR'
complete -c docker-create -l blkio-weight -d '	Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
complete -c docker-create -l blkio-weight-device -d '	Block IO weight (relative device weight)'
complete -c docker-create -l cap-add -d '	Add Linux capabilities'
complete -c docker-create -l cap-drop -d '	Drop Linux capabilities'
complete -c docker-create -l cgroup-parent -d '	Optional parent cgroup for the container'
complete -c docker-create -l cgroupns -d '	Cgroup namespace to use (host|private)            default-cgroupns-mode opti…'
complete -c docker-create -l cidfile -d '	Write the container ID to the file'
complete -c docker-create -l cpu-count -d '	CPU count (Windows only)'
complete -c docker-create -l cpu-percent -d '	CPU percent (Windows only)'
complete -c docker-create -l cpu-period -d '	Limit CPU CFS (Completely Fair Scheduler) period'
complete -c docker-create -l cpu-quota -d '	Limit CPU CFS (Completely Fair Scheduler) quota'
complete -c docker-create -l cpu-rt-period -d '	Limit CPU real-time period in microseconds'
complete -c docker-create -l cpu-rt-runtime -d '	Limit CPU real-time runtime in microseconds'
complete -c docker-create -s c -l cpu-shares -d '	CPU shares (relative weight)'
complete -c docker-create -l cpus -d '	Number of CPUs'
complete -c docker-create -l cpuset-cpus -d '	CPUs in which to allow execution (0-3, 0,1)'
complete -c docker-create -l cpuset-mems -d '	MEMs in which to allow execution (0-3, 0,1)'
complete -c docker-create -l device -d '	Add a host device to the container'
complete -c docker-create -l device-cgroup-rule -d '	Add a rule to the cgroup allowed devices list'
complete -c docker-create -l device-read-bps -d '	Limit read rate (bytes per second) from a device'
complete -c docker-create -l device-read-iops -d '	Limit read rate (IO per second) from a device'
complete -c docker-create -l device-write-bps -d '	Limit write rate (bytes per second) to a device'
complete -c docker-create -l device-write-iops -d '	Limit write rate (IO per second) to a device'
complete -c docker-create -l disable-content-trust -d '	Skip image verification'
complete -c docker-create -l dns -d '	Set custom DNS servers'
complete -c docker-create -l dns-option -d '	Set DNS options'
complete -c docker-create -l dns-search -d '	Set custom DNS search domains'
complete -c docker-create -l domainname -d '	Container NIS domain name'
complete -c docker-create -l entrypoint -d '	Overwrite the default ENTRYPOINT of the image'
complete -c docker-create -s e -l env -d '	Set environment variables'
complete -c docker-create -l env-file -d '	Read in a file of environment variables'
complete -c docker-create -l expose -d '	Expose a port or a range of ports'
complete -c docker-create -l gpus -d '	GPU devices to add to the container (\'all\' to pass all GPUs)'
complete -c docker-create -l group-add -d '	Add additional groups to join'
complete -c docker-create -l health-cmd -d '	Command to run to check health'
complete -c docker-create -l health-interval -d '	Time between running the check (ms|s|m|h) (default 0s)'
complete -c docker-create -l health-retries -d '	Consecutive failures needed to report unhealthy'
complete -c docker-create -l health-start-interval -d '	Time between running the check during the start period (ms|s|m|h) (default 0…'
complete -c docker-create -l health-start-period -d '	Start period for the container to initialize before starting health-retries …'
complete -c docker-create -l health-timeout -d '	Maximum time to allow one check to run (ms|s|m|h) (default 0s)'
complete -c docker-create -l help -d '	Print usage'
complete -c docker-create -s h -l hostname -d '	Container host name'
complete -c docker-create -l init -d '	Run an init inside the container that forwards signals and reaps processes'
complete -c docker-create -s i -l interactive -d '	Keep STDIN open even if not attached'
complete -c docker-create -l io-maxbandwidth -d '	Maximum IO bandwidth limit for the system drive (Windows only)'
complete -c docker-create -l io-maxiops -d '	Maximum IOps limit for the system drive (Windows only)'
complete -c docker-create -l ip -d '	IPv4 address (e. g. , 172. 30. 100. 104)'
complete -c docker-create -l ip6 -d '	IPv6 address (e. g. , 2001:db8::33)'
complete -c docker-create -l ipc -d '	IPC mode to use'
complete -c docker-create -l isolation -d '	Container isolation technology'
complete -c docker-create -l kernel-memory -d '	Kernel memory limit'
complete -c docker-create -s l -l label -d '	Set meta data on a container'
complete -c docker-create -l label-file -d '	Read in a line delimited file of labels'
complete -c docker-create -l link -d '	Add link to another container'
complete -c docker-create -l link-local-ip -d '	Container IPv4/IPv6 link-local addresses'
complete -c docker-create -l log-driver -d '	Logging driver for the container'
complete -c docker-create -l log-opt -d '	Log driver options'
complete -c docker-create -l mac-address -d '	Container MAC address (e. g. , 92:d0:c6:0a:29:33)'
complete -c docker-create -s m -l memory -d '	Memory limit'
complete -c docker-create -l memory-reservation -d '	Memory soft limit'
complete -c docker-create -l memory-swap -d '	Swap limit equal to memory plus swap: \'-1\' to enable unlimited swap'
complete -c docker-create -l memory-swappiness -s 1 -d '	Tune container memory swappiness (0 to 100)'
complete -c docker-create -l mount -d '	Attach a filesystem mount to the container'
complete -c docker-create -l name -d '	Assign a name to the container'
complete -c docker-create -l network -d '	Connect a container to a network'
complete -c docker-create -l network-alias -d '	Add network-scoped alias for the container'
complete -c docker-create -l no-healthcheck -d '	Disable any container-specified HEALTHCHECK'
complete -c docker-create -l oom-kill-disable -d '	Disable OOM Killer'
complete -c docker-create -l oom-score-adj -d '	Tune host\'s OOM preferences (-1000 to 1000)'
complete -c docker-create -l pid -d '	PID namespace to use'
complete -c docker-create -l pids-limit -d '	Tune container pids limit (set -1 for unlimited)'
complete -c docker-create -l platform -d '	Set platform if server is multi-platform capable'
complete -c docker-create -l privileged -d '	Give extended privileges to this container'
complete -c docker-create -s p -l publish -d '	Publish a container\'s port(s) to the host'
complete -c docker-create -s P -l publish-all -d '	Publish all exposed ports to random ports'
complete -c docker-create -l pull -d '	Pull image before creating ("always", "|missing", "never")'
complete -c docker-create -s q -l quiet -d '	Suppress the pull output'
complete -c docker-create -l read-only -d '	Mount the container\'s root filesystem as read only'
complete -c docker-create -l restart -d '	Restart policy to apply when a container exits'
complete -c docker-create -l rm -d '	Automatically remove the container when it exits'
complete -c docker-create -l runtime -d '	Runtime to use for this container'
complete -c docker-create -l security-opt -d '	Security Options'
complete -c docker-create -l shm-size -d '	Size of /dev/shm'
complete -c docker-create -l stop-signal -d '	Signal to stop the container'
complete -c docker-create -l stop-timeout -d '	Timeout (in seconds) to stop a container'
complete -c docker-create -l storage-opt -d '	Storage driver options for the container'
complete -c docker-create -l sysctl -d '	Sysctl options'
complete -c docker-create -l tmpfs -d '	Mount a tmpfs directory'
complete -c docker-create -s t -l tty -d '	Allocate a pseudo-TTY'
complete -c docker-create -l ulimit -d '	Ulimit options'
complete -c docker-create -s u -l user -d '	Username or UID (format: [:])'
complete -c docker-create -l userns -d '	User namespace to use'
complete -c docker-create -l uts -d '	UTS namespace to use'
complete -c docker-create -s v -l volume -d '	Bind mount a volume'
complete -c docker-create -l volume-driver -d '	Optional volume driver for the container'
complete -c docker-create -l volumes-from -d '	Mount volumes from the specified container(s)'
complete -c docker-create -s w -l workdir -d '	Working directory inside the container SEE ALSO'

