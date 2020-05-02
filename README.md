# kali_confiig


1. Install midnight commander, mosh, gcc, python 3.8, font config
```
apt update
apt upgrade
apt install mc mosh ufw build-essential python3.8 fontconfig
```
2. webdav
```
mkdir ~/webdav  
cd ~/webdav 
https://github.com/yar229/WebDavMailRuCloud/releases/download/1.11.0.20/WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip
unzip WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip
rm -rf WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip

net core:
sudo apt-get install apt-transport-https (???)
mkdir ~/dotnet-arm64
cd ~/dotnet-arm64
wget https://download.visualstudio.microsoft.com/download/pr/98a2e556-bedd-46c8-b3fa-96a9f1eb9556/09f60d50e3cbba0aa16d48ceec9dcb0b/dotnet-sdk-3.1.201-linux-arm64.tar.gz
tar zxf dotnet-sdk-3.1.201-linux-arm64.tar.gz
rm -rf dotnet-sdk-3.1.201-linux-arm64.tar.gz
export DOTNET_ROOT=$HOME/dotnet-arm64
export PATH=$PATH:$HOME/dotnet-arm64
cd ~/webdav 
dotnet wdmrc.dll -p 8888
```
3. rdp
```
apt install xrdp
systemctl enable xrdp
systemctl restart xrdp
```

