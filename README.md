# Alpine-WSL

An WSL distro based on Alpine Linux minirootfs. This distribution is meant as a host for devcontainers that use Podman.
Default user: root
Default passwd: root

## Features
A WSL distro for Alpine including:
- podman/podman-compose
- git
- openssh-client
- rsync

## Build
To quickly build the Alpine.wsl use command below:
```bash
wget https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/build-alpine-wsl.sh -O - | sh
```
