# kali_confiig

I. Simple server configuration 

1. Install midnight commander, mosh, mosh, 
```
apt update
apt full-upgrade
apt install mc mosh ufw software-properties-common rclone fail2ban xrdp cryptsetup transmission-cli transmission-common transmission-daemon
```
2. config files
```
git clone https://github.com/t1mron/kali-config.git ~/git/kali-config/ && source ~/git/kali-config/files/bash.sh && config_pull
git clone https://github.com/RPi-Distro/raspi-config.git ~/git/raspi-config && cd ~/git/raspi-config && chmod +x raspi-config && mv raspi-config /usr/local/bin && raspi-config
systemctl start fail2ban && systemctl enable fail2ban && systemctl status fail2ban
```
3. ufw
```
ufw allow 62971/tcp && ufw allow 60000:61000/udp && ufw allow 3389 && ufw enable && ufw reload
```
4. rclone
```
rclone config
systemctl start cloud_google&&systemctl enable cloud_google&&systemctl status cloud_google
systemctl start cloud_yandex&&systemctl enable cloud_yandex&&systemctl status cloud_yandex
systemctl start cloud_mail&&systemctl enable cloud_mail&&systemctl status cloud_mail
```
5. torrent
```
usermod -a -G debian-transmission root
service transmission-daemon start && service transmission-daemon enable && service transmission-daemon status

transmission-remote -a

```
6. encrypt disk
```
cryptsetup -v --verify-passphrase luksFormat <your_disk>
cryptsetup luksOpen <your_disk> backup
mkfs.ext4 /dev/mapper/backup
cryptsetup luksClose /dev/mapper/backup
```
mount disk
```
cryptsetup open /dev/sda1 backup
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




