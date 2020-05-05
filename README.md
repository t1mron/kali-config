# kali_confiig


1. Install midnight commander, mosh, gcc, python 3.8, font config
```
apt update
apt upgrade
apt install mc mosh ufw build-essential python3.8 fontconfig
```
2. ufw
```
ufw allow ssh
ufw allow mosh
ufw allow rdp
ufw allow 8888
ufw enable
ufw reload
```
3. webdav
```
davfs2:
apt install davfs2
usermod -aG davfs2 root
mkdir /mnt/cloud_mail

net core:
sudo apt-get install apt-transport-https (???)
wget https://download.visualstudio.microsoft.com/download/pr/98a2e556-bedd-46c8-b3fa-96a9f1eb9556/09f60d50e3cbba0aa16d48ceec9dcb0b/dotnet-sdk-3.1.201-linux-arm64.tar.gz ~/dotnet-arm64
tar zxf dotnet-sdk-3.1.201-linux-arm64.tar.gz && rm -rf dotnet-sdk-3.1.201-linux-arm64.tar.gz

wget https://github.com/yar229/WebDavMailRuCloud/releases/download/1.11.0.20/WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip ~/webdav/webdav_mail
unzip WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip && rm -rf WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip

wget....           /etc/systemd/system/
```
3. rdp
```
apt install xrdp
systemctl enable xrdp
systemctl restart xrdp
```

