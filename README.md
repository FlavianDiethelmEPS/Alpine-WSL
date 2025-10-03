# Alpine-WSL
This repo provides a script to build a WSL distro based on the latest Alpine Linux minirootfs. The resulting distro contains a few additional features and is intended to work as a lightweight provider for devcontainers.

## Credentials
Default user: root
Default passwd: root

## Features
This distro installs the following packages during the OOBE procedure:
- podman: container provider
- podman-compose: adds the compose utility for podman
- iptables: required by podman
- git: version control system
- openssh-client: client to manage security keys
- rsync: remote syncronisation to back up files locally

## Usage
Build the Alpine.wsl file using the command below, then simply execute the file and a new distro including a startmenu shortcut and terminal profile gets set up.
```bash
wget https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/build-alpine-wsl.sh -O - | sh
```
