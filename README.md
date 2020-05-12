# kali_confiig

I. Simple server configuration 

1. Install midnight commander, mosh, mosh, 
```
apt update
apt full-upgrade
apt install mc mosh ufw software-properties-common davfs2 fail2ban libfuse-dev libwxbase3.0-dev
```
2. ufw
```
ufw allow ssh && ufw allow mosh && ufw allow 8888 && ufw enable && ufw reload
```
3. config files
```
git clone https://github.com/t1mron/kali-config.git ~/git/kali-config/ && source ~/git/kali-config/files/bash.sh && config_pull
git clone https://github.com/RPi-Distro/raspi-config.git ~/git/raspi-config && cd ~/git/raspi-config && chmod +x raspi-config && mv raspi-config /usr/local/bin && raspi-config
systemctl start fail2ban && systemctl enable fail2ban
```

4. webdav

davfs2:
```
usermod -aG davfs2 root
mkdir ~/mnt && mkdir ~/mnt/{cloud_mail,cloud_yandex,cloud_google,hdd}
```
webdav_mail:
```
wget -P ~/dotnet-arm64/ https://download.visualstudio.microsoft.com/download/pr/98a2e556-bedd-46c8-b3fa-96a9f1eb9556/09f60d50e3cbba0aa16d48ceec9dcb0b/dotnet-sdk-3.1.201-linux-arm64.tar.gz&&cd ~/dotnet-arm64/&&tar -xzf dotnet-sdk-3.1.201-linux-arm64.tar.gz&&rm -rf dotnet-sdk-3.1.201-linux-arm64.tar.gz

wget -P ~/webdav/webdav_mail https://github.com/yar229/WebDavMailRuCloud/releases/download/1.11.0.20/WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip&&cd ~/webdav/webdav_mail&&unzip WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip&&rm -rf WebDAVCloudMailRu-1.11.0.20-dotNetCore30.zip
systemctl start webdav_mail && systemctl enable webdav_mail
```
```
mount -a
```

II Terminal customization

1. Install snap, rust, LSD, zsh, vim-plug,tmp, tmux_config, 
```
apt install snapd && systemctl enable --now snapd apparmor

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
reboot
cargo install lsd

apt install zsh 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/gpakosz/.tmux.git  ~/git/tmux-config/ && ln -s -f ~/git/tmux-config/.tmux.conf
```
You need to install custom fonts into your mobile app (for example, blink shell) or into pc (nerd-fonts)<br/>

2. Update
```
tmux
Press prefix + I (capital i, as in Install) to fetch the plugins
vim: :PlugInstall
```
Profit! Enjoy :)

clone sd card and shrink:
```
dd if=/dev/mmcblk0 of=~/mnt/hdd/kali_backup.img

git clone https://github.com/Drewsif/PiShrink.git ~/git/PiShrink/ && cd ~/git/PiShrink/ && chmod +x pishrink.sh && mv pishrink.sh /usr/local/bin
pishrink.sh /root/mnt/hdd/kali_backup.img
```




