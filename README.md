# kali_confiig


1. Install midnight commander, mosh, mosh, golang
```
apt update
apt upgrade
apt install mc mosh ufw
apt install software-properties-common
```
2. ufw
```
ufw allow ssh
ufw allow mosh
ufw allow 3389
ufw allow 8888
ufw enable
ufw reload
```
3. Install raspi-config
```
git clone https://github.com/RPi-Distro/raspi-config.git ~/git/raspi-config
source raspi-config
```
3. webdav
```
davfs2:
apt install davfs2
usermod -aG davfs2 root

mkdir /root/mnt
mkdir /root/mnt/cloud_mail
mkdir /root/mnt/cloud_yandex
mkdir /root/mnt/cloud_google

net core:
mkdir dotnet-arm64
cd dotnet-arm64
wget https://download.visualstudio.microsoft.com/download/pr/98a2e556-bedd-46c8-b3fa-96a9f1eb9556/09f60d50e3cbba0aa16d48ceec9dcb0b/dotnet-sdk-3.1.201-linux-arm64.tar.gz /root/dotnet-arm64
tar zxf dotnet-sdk-3.1.201-linux-arm64.tar.gz && rm -rf dotnet-sdk-3.1.201-linux-arm64.tar.gz

webdav_mail:
mdkir /root/webdav
mdkir /root/webdav/webdav_mail
cd /root/webdav/webdav_mail
wget https://github.com/yar229/WebDavMailRuCloud/releases/download/1.11.0.20/WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip 
unzip WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip && rm -rf WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip

cp            /lib/systemd/system/webdav_mail.service
systemctl start webdav_mail
systemctl enable webdav_mail

webdav_google:
pip3 install gdrivefs


mount -a
```
3. rdp
```
apt install xrdp
systemctl start xrdp
systemctl enable xrdp
```


