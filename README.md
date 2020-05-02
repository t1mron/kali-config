# kali_confiig

I. Simple server configuration 

1. Install midnight commander, mosh, gcc, python 3.8, font config
```
sudo apt update
sudo apt upgrade
sudo apt install mc mosh build-essential python3.8 fontconfig
```
2. Clone repository 
```
git clone https://github.com/T1mron/linux_config.git ~/git/linux_config/
```
3. Change hostname
```
sudo cp ~/git/linux_config/files/hostname /etc/
```
4. Custom ssh port
```
sudo cp ~/git/linux_config/files/ssh
