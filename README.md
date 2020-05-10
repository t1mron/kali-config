# kali_confiig


1. Install midnight commander, mosh, mosh, 
```
apt update
apt upgrade
apt install mc mosh ufw software-properties-common gparted xrdp davfs2
```
2. ufw
```
ufw allow ssh
ufw allow mosh
ufw allow 3389
ufw allow 8888
ufw enable
ufw reload
systemctl start xrdp
systemctl enable xrdp
```
1. config files
```
git clone https://github.com/t1mron/kali_config.git ~/git/kali_config/
cp ~/git/kali_config/files/webdav_mail.service /lib/systemd/system/
cp ~/git/kali_config/files/{davfs2.conf,secrets} /etc/davfs2/
cp ~/git/kali_config/files/fstab /etc/
cp ~/git/kali_config/files/bash.sh ~/scripts/
```
1. bios update
```
curl -L --output /usr/bin/rpi-update https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update && sudo chmod +x /usr/bin/rpi-update && rpi-update
```
1. Install raspi-config
```
git clone https://github.com/RPi-Distro/raspi-config.git ~/git/raspi-config && source ~/git/raspi-config/raspi-config
```
3. webdav

davfs2:
```
usermod -aG davfs2 root
mkdir ~/mnt
mkdir ~/mnt/{cloud_mail,cloud_yandex,cloud_google,hdd}
```
net core:
```
wget -P ~/dotnet-arm64/ https://download.visualstudio.microsoft.com/download/pr/98a2e556-bedd-46c8-b3fa-96a9f1eb9556/09f60d50e3cbba0aa16d48ceec9dcb0b/dotnet-sdk-3.1.201-linux-arm64.tar.gz&&cd ~/dotnet-arm64/&&tar -xzf dotnet-sdk-3.1.201-linux-arm64.tar.gz&&rm -rf dotnet-sdk-3.1.201-linux-arm64.tar.gz
```
webdav_mail:
```
wget -P ~/webdav/webdav_mail https://github.com/yar229/WebDavMailRuCloud/releases/download/1.11.0.20/WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip && cd ~/webdav/webdav_mail && unzip WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip && rm -rf WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip
systemctl start webdav_mail
systemctl enable webdav_mail
```
```
mount -a
```







