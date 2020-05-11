# kali_confiig

I. Simple server configuration 

1. Install midnight commander, mosh, mosh, 
```
apt update
apt full-upgrade
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
git clone https://github.com/t1mron/kali-config.git ~/git/kali-config/
cp ~/git/kali-config/files/webdav_mail.service /lib/systemd/system/
cp ~/git/kali-config/files/{davfs2.conf,secrets} /etc/davfs2/
cp ~/git/kali-config/files/fstab /etc/
cp ~/git/kali-config/files/bash.sh ~/scripts/
```
1. Install raspi-config
```
git clone https://github.com/RPi-Distro/raspi-config.git ~/git/raspi-config && cd ~/git/raspi-config && chmod +x raspi-config && mv raspi-config /usr/local/bin && raspi-config
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
wget -P ~/webdav/webdav_mail https://github.com/yar229/WebDavMailRuCloud/releases/download/1.11.0.20/WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip&&cd ~/webdav/webdav_mail&&unzip WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip&&rm -rf WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip
systemctl start webdav_mail
systemctl enable webdav_mail
```
```
mount -a
```

II Terminal customization

1. Install snap, rust, LSD, zsh, vim-plug,tmp, tmux_config, 
```
apt install snapd
systemctl enable --now snapd apparmor

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
reboot
cargo install lsd

apt install zsh 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

reboot 

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/gpakosz/.tmux.git  ~/git/tmux-config/
ln -s -f ~/git/tmux-config/.tmux.conf
```
You need to install custom fonts into your mobile app (for example, blink shell) or into pc (nerd-fonts)<br/>
2. set conf files
```
sudo cp ~/git/linux_config/files/{antigen.zsh,.zshrc,.p10k.zsh,.tmux.conf.local,bash.sh,.vimrc} ~/
```

3. Update
```
tmux
Press prefix + I (capital i, as in Install) to fetch the plugins
```
Profit! Enjoy :)







