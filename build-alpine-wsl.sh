#/bin/sh

wget -O assets https://github.com/FlavianDiethelmEPS/Alpine-WSL/tree/main/assets
chown root:root assets
wget -O apline.tar.gz https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-3.22.0-x86_64.tar.gz
mkdir rootfs
cd rootfs
tar -xzf ../apline.tar.gz
mv ../assets .
tar -c * | gzip --best > ../Alpine.wsl
cd ..
rm -rf rootfs
rm -rf assets
rm -rf apline.tar.gz
echo "Done! Alpine.wsl created"
