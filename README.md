# raspi-config

I. Simple server configuration 
1. Packages  
```
apt update
apt full-upgrade
apt install mc vim tmux mosh ufw xrdp software-properties-common fail2ban cryptsetup transmission-cli transmission-daemon
curl https://rclone.org/install.sh | sudo bash
systemctl enable xrdp && systemctl restart xrdp && systemctl status xrdp
touch ~/.hushlogin
```
2. Configuration files
```
mkdir ~/scripts && git clone https://github.com/t1mron/raspi-config.git ~/git/raspi-config/ && source ~/git/raspi-config/files/scripts/main.sh && update_config 
```
3. Firewall
```
ufw allow 1724/tcp && ufw allow 2288/tcp && ufw allow 60000:61000/udp && ufw enable && ufw reload
systemctl start fail2ban && systemctl enable fail2ban && systemctl status fail2ban
```
4. Wi-Fi client
```
nano /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
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
mkdir /root/mnt && mkdir /root/mnt/{hdd,cloud_mail,cloud_yandex,cloud_google}
rclone config
systemctl start cloud_google&&systemctl enable cloud_google&&systemctl status cloud_google
systemctl start cloud_yandex&&systemctl enable cloud_yandex&&systemctl status cloud_yandex
systemctl start cloud_mail&&systemctl enable cloud_mail&&systemctl status cloud_mail
```
6. torrent
```
cat > /etc/sysctl.conf <<EOF
net.core.rmem_max = 16777216
net.core.wmem_max = 4194304
EOF
```
```
sysctl -p
systemctl enable transmission-daemon.service && service transmission-daemon start && service transmission-daemon status
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
1. Packages
```
git clone https://github.com/LionSec/katoolin.git ~/git/katoolin/ && cp -r ~/git/katoolin/katoolin.py /usr/bin/katoolin && chmod +x /usr/bin/katoolin && katoolin
```
2. WiFi-driver RTL88x2B
```
apt install dkms bc 
git clone https://github.com/cilynx/rtl88x2bu ~/git/rtl88x2bu/ && cd ~/git/rtl88x2bu/
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
VER=$(sed -n 's/\PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)
sudo rsync -rvhP ./ /usr/src/rtl88x2bu-${VER}
sudo dkms add -m rtl88x2bu -v ${VER}
sudo dkms build -m rtl88x2bu -v ${VER}
sudo dkms install -m rtl88x2bu -v ${VER}
sudo modprobe 88x2bu
```
USB 3.0 support
```
modprobe 88x2bu rtw_switch_usb_mode=1
```
Static WLAN name:
```
ip a
nano /etc/udev/rules.d/72-001.rules
```
```
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="b8:27:eb:98:a0:cd", NAME="wlan1"
```
Profit! Enjoy :)

clone sd card and shrink
```
dd if=/dev/mmcblk0 of=/root/mnt/hdd/downloads/raspi_backup.img

git clone https://github.com/Drewsif/PiShrink.git ~/git/PiShrink/ && cp -r ~/git/PiShrink/pishrink.sh /usr/local/bin/pishrink && chmod +x /usr/local/bin/pishrink
pishrink /root/mnt/hdd/downloads/raspi_backup.img
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
