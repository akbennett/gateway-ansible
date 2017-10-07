#!/bin/sh
### BEGIN INIT INFO
# Provides:             osfagent
# Required-Start:
# Required-Stop:
# Default-Start:        S
# Default-Stop:
### END INIT INFO

read CMDLINE < /proc/cmdline
for x in $CMDLINE; do
        case $x in
        osfagent=false)
		echo "OSF agent disabled"
		exit 0;
                ;;
        esac
done

jobfile=/home/linaro/osftargets.conf
count=1
cat $jobfile|while read repo branch
do
    echo $count $repo $branch
    docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name=agent_$count --rm \
      opensourcefoundries/agent:latest $repo $branch
    count=$((count+1))
done
