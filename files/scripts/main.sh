#!/bin/bash
# -- user customizations -------------------------------------------------------

# -- functions ----------------------
function update_config()
	{
	cd ~/git/raspi-config/files/ && git pull;
	cp ~/git/raspi-config/files/scripts/main.sh ~/scripts/;
	cp ~/git/raspi-config/files/scripts/{.bashrc,.profile} ~/;
	cp {.tmux.conf.local,.vimrc} ~/;
	cp ~/git/raspi-config/files/host/{hostname,hosts} /etc/;
	cp ~/git/raspi-config/files/host/sshd_config /etc/ssh/;
	cp ~/git/raspi-config/files/host/jail.local /etc/fail2ban/;
	cp ~/git/raspi-config/files/systemctl/{transmission-daemon.service,cloud_google.service,cloud_mail.service,cloud_yandex.service} /lib/systemd/system/;
	}

# -- aliases ----------------------
command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias python='python3.8'
alias tsm='transmission-remote'
