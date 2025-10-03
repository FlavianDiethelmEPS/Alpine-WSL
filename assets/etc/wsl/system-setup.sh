#/bin/sh

apk update
apk upgrade
apk add doas podman podman-compose iptables git openssh-client
mkdir -p /etc/doas.d
echo 'permit nopass :wheel' > /etc/doas.d/20-wheel.conf
echo 'root:root' | chpasswd
