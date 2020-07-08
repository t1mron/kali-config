# kali_config

I. Simple server configuration 
1. Packages  
```
apt update
apt full-upgrade
apt install mc mosh ufw software-properties-common rclone fail2ban xrdp cryptsetup transmission-cli transmission-common transmission-daemon dkms hostapd
systemctl enable xrdp && systemctl restart xrdp && systemctl status xrdp
touch ~/.hushlogin
```
2. Configuration files
```
git clone https://github.com/t1mron/kali-config.git ~/git/kali-config/ && source ~/git/kali-config/files/scripts/main.sh && config_pull && localedef -i en_US -f UTF-8 en_US.UTF-8
```
3. Firewall
```
ufw allow 1724/tcp && ufw allow 60000:61000/udp && ufw allow 3389 && ufw enable && ufw reload
systemctl start fail2ban && systemctl enable fail2ban && systemctl status fail2ban
```
4. AP + Wi-Fi client
```
systemctl unmask hostapd && systemctl enable hostapd
sudo -Es
apt --autoremove purge ifupdown dhcpcd5 isc-dhcp-client isc-dhcp-common rsyslog
apt-mark hold ifupdown dhcpcd5 isc-dhcp-client isc-dhcp-common rsyslog openresolv
rm -r /etc/network /etc/dhcp
apt --autoremove purge avahi-daemon
apt-mark hold avahi-daemon libnss-mdns
apt install libnss-resolve
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl enable systemd-networkd.service systemd-resolved.service

cat > /etc/hostapd/hostapd.conf <<EOF
interface=ap0
driver=nl80211
ssid=sp0t 
country_code=RU
hw_mode=g
channel=1
auth_algs=1
wpa=2
wpa_passphrase=!VeryHardPassw0rd!
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOF

chmod 600 /etc/hostapd/hostapd.conf

systemctl --full edit hostapd.service (#After=network.target)





git clone https://github.com/Alexander88207/Tomomi.git ~/git/wifi-driver/ && bash ~/git/wifi-driver/Tomomi.sh

chmod +x raspi-config && mv raspi-config /usr/local/bin && raspi-config


cd ~/git/ && git clone https://github.com/cilynx/rtl88x2bu
dkms add ./rtl88x2bu
dkms install -m rtl88x2bu -v 5.6.1
modprobe 88x2bu
reboot

./setup-network.sh --install-upgrade --ap-ssid="spot" --ap-password="password" --ap-password-encrypt --ap-country-code="RU" --ap-ip-address="192.168.3.1" --wifi-interface="wlan0"
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
systemctl enable transmission-daemon.service && service transmission-daemon start && service transmission-daemon status
tsm -w ~/mnt/hdd/downloads/
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
Profit! Enjoy :)


clone sd card and shrink
```
dd if=/dev/mmcblk0 of=/root/mnt/hdd/downloads/kali_backup.img

git clone https://github.com/Drewsif/PiShrink.git ~/git/PiShrink/ && cd ~/git/PiShrink/ && chmod +x pishrink.sh && mv pishrink.sh /usr/local/bin
pishrink.sh /root/mnt/hdd/downloads/kali_backup.img
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



