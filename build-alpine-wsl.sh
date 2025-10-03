#/bin/sh

mkdir alpine
cd alpine
wget https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-3.22.0-x86_64.tar.gz -O - | tar -xz
cd etc
wget https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl-distribution.conf -O wsl-distribution.conf
wget https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl.conf -O wsl.conf
mkdir wsl
cd wsl
wget https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl/system-setup.sh -O system-setup.sh
wget https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl/system-start.sh -O system-start.sh
chmod u+x *
cd ../..
tar -c * | gzip --best > ../Alpine.wsl
cd ..
rm -rf alpine
echo "Done! Alpine.wsl created"
