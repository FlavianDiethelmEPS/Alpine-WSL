# Alpine-WSL

An WSL distro based on Alpine Linux minirootfs.


## Features
A WSL distro for Alpine including:
- podman/podman-compose
- git
- openssh-client
- rsync

## Build
To quickly build the Alpine.wsl use command below:
```pwsh
Invoke-WebRequest https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/main/build-alpine-wsl.ps1 -UseBasicParsing | Select-Object -ExpandProperty Content | Invoke-Expression
```
```sh
wget https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/build-alpine-wsl.sh -O - | sh
```
