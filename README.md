# kali_confiig

I. Simple server configuration 

1. Install midnight commander, mosh, mosh, 
```
apt update
apt full-upgrade
apt install mc mosh ufw software-properties-common fail2ban cryptsetup
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

4. rclone
```
rclone config

```
5. encrypt disk
```
cryptsetup -v --verify-passphrase luksFormat <your_disk>
cryptsetup luksOpen <your_disk> backup
mkfs.ext4 /dev/mapper/backup
cryptsetup luksClose /dev/mapper/backup
```
mount disk
```
cryptsetup open <your_disk> backup
mount /dev/mapper/backup ~/mnt/hdd
```

II Terminal customization

1. Install rust, LSD, zsh, vim-plug,tmp, tmux_config, 
```
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




