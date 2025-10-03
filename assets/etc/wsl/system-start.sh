#/bin/sh

# mkdir -p /run/openrc
# touch /run/openrc/softlevel
# openrc
podman system service
crond -b
