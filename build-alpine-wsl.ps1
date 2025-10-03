$indexHtml = Invoke-WebRequest -Uri "https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/" -UseBasicParsing
$latestVersion = ($indexHtml.Content -split "`n" | Select-String -Pattern 'alpine-minirootfs-(\d+\.\d+\.\d+)-x86_64\.tar\.gz' | ForEach-Object {
    if ($_ -match 'alpine-minirootfs-(\d+\.\d+\.\d+)-x86_64\.tar\.gz') { $matches[1] }
}) | Sort-Object {[version]$_} | Select-Object -Last 1
$tarball = "alpine-minirootfs-$latestVersion-x86_64.tar.gz"
$tarballUrl = "https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/$tarball"

New-Item -ItemType Directory -Force -Path "alpine" | Out-Null
Set-Location "alpine"
Invoke-WebRequest -Uri $tarballUrl -OutFile $tarball
tar -xzf $tarball
Remove-Item $tarball
Set-Location "etc"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl-distribution.conf" -OutFile "wsl-distribution.conf"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl.conf" -OutFile "wsl.conf"
New-Item -ItemType Directory -Force -Path "wsl" | Out-Null
Set-Location "wsl"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl/system-setup.sh" -OutFile "system-setup.sh"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/etc/wsl/system-start.sh" -OutFile "system-start.sh"
Set-Location ../..
New-Item -ItemType Directory -Force -Path "usr/lib/wsl" | Out-Null
Set-Location "usr/lib/wsl"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/usr/lib/wsl/icon.ico" -OutFile "icon.ico"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/FlavianDiethelmEPS/Alpine-WSL/refs/heads/main/assets/usr/lib/wsl/profile.json" -OutFile "profile.json"
Set-Location ../../../..
Compress-Archive -Path "alpine\*" -DestinationPath "Alpine.wsl"
Remove-Item -Recurse -Force "alpine"
Write-Host "Done! Alpine.wsl created"
pause
