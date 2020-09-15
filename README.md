# raspi-config

I. Simple server configuration 
1. Packages  
```
sudo apt update
sudo apt full-upgrade
sudo apt install vim tmux mc gparted mosh ufw xrdp rclone software-properties-common fail2ban cryptsetup transmission-cli transmission-daemon dkms
curl https://rclone.org/install.sh | sudo bash
sudo systemctl enable xrdp &&sudo systemctl restart xrdp &&sudo systemctl status xrdp
touch ~/.hushlogin
```
2. Configuration files
```
mkdir ~/scripts && git clone https://github.com/t1mron/raspi-config.git ~/git/raspi-config/ && source ~/git/raspi-config/files/scripts/main.sh && update_config 
```
3. Firewall
```
sudo ufw allow 1724/tcp &&sudo ufw allow 2288/tcp &&sudo ufw allow 60000:61000/udp &&sudo ufw enable &&sudo ufw reload
sudo systemctl start fail2ban &&sudo systemctl enable fail2ban &&sudo systemctl status fail2ban
```
4. Wi-Fi client
```
sudo nano /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
```
```
country=RU
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="h0me"
    psk="password"
    priority=1
    id_str="home"
}

network={
    ssid="sp0t"
    psk="password"
    priority=10
    id_str="ap"
}
```
5. rclone (cloud storage)
```
mkdir ~/media/{hdd,cloud_mail,cloud_yandex,cloud_google}
rclone config
sudo systemctl start cloud_google&&sudo systemctl enable cloud_google&&sudo systemctl status cloud_google
sudo systemctl start cloud_yandex&&sudo systemctl enable cloud_yandex&&sudo systemctl status cloud_yandex
sudo systemctl start cloud_mail&&sudo systemctl enable cloud_mail&&sudo systemctl status cloud_mail
```
6. torrent
```
cat > /etc/sysctl.conf <<EOF
net.core.rmem_max = 16777216
net.core.wmem_max = 4194304
EOF
```
```
sudo sysctl -p
sudo systemctl enable transmission-daemon.service &&sudo service transmission-daemon start &&sudo service transmission-daemon status
tsm -w ~/mnt/hdd/downloads/
```
```
tsm -a "link"
tsm -l
tsm -t ID -r
tsm -t all -r
```
II Terminal customization

1. Install rust, LSD, tmp, tmux-config
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
reboot
cargo install lsd
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/gpakosz/.tmux.git ~/git/tmux-config && cp ~/git/tmux-config/.tmux.conf ~/
```
You need to install custom fonts into your mobile app (for example, blink shell) or into pc (nerd-fonts)<br/>

2. Update
```
tmux
Press prefix + I (capital i, as in Install) to fetch the plugins
vim: :PlugInstall
```
III Kali tools
Static WLAN name:
```
ip a
nano /etc/udev/rules.d/72-001.rules
```
```
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="b8:27:eb:98:a0:cd", NAME="wlan1"
```
Profit! Enjoy :)

install img in sd card
```
dd bs=4M if=kali_backup.img of=/dev/sdX conv=fsync
```
clone sd card and shrink
```
dd if=/dev/mmcblk0 of=/root/mnt/hdd/downloads/kali_backup.img

git clone https://github.com/Drewsif/PiShrink.git ~/git/PiShrink/ && cp -r ~/git/PiShrink/pishrink.sh /usr/local/bin/pishrink && chmod +x /usr/local/bin/pishrink
pishrink /root/mnt/hdd/downloads/kali_backup.img
```
encrypt disk
```
cryptsetup -v --verify-passphrase luksFormat <your_disk>
cryptsetup luksOpen <your_disk> backup
mkfs.ext4 /dev/mapper/backup
cryptsetup luksClose /dev/mapper/backup
```
mount disk
```
cryptsetup open /dev/sdx1 backup
mount /dev/mapper/backup ~/mnt/hdd
```
