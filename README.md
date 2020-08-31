# kali-config

I. Simple server configuration 
1. Packages  
```
apt update
apt full-upgrade
apt install mc mosh ufw xrdp rclone software-properties-common fail2ban cryptsetup transmission-cli transmission-daemon dkms
systemctl enable xrdp && systemctl restart xrdp && systemctl status xrdp
touch ~/.hushlogin
```
2. Configuration files
```
mkdir ~/scripts && git clone https://github.com/t1mron/kali-config.git ~/git/kali-config/ && source ~/git/kali-config/files/scripts/main.sh && update_config && localedef -i en_US -f UTF-8 en_US.UTF-8
git clone https://github.com/RPi-Distro/raspi-config.git ~/git/raspi-config/ && cp ~/git/raspi-config/raspi-config /usr/local/bin/ && chmod 755 /usr/local/bin/raspi-config
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
```
cat > /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto wlan0
allow-hotplug wlan0
iface wlan0 inet dhcp
    wpa-conf /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
EOF
```
```
systemctl start wpa_supplicant &&  systemctl enable wpa_supplicant && systemctl status wpa_supplicant
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
1. WiFi-driver RTL8812BU
```
git clone https://github.com/fastoe/RTL8812BU.git ~/git/RTL8812BU && dkms add ~/git/RTL8812BU/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960 && dkms install -m rtl88x2bu -v 5.3.1 && modprobe 88x2bu && reboot
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
