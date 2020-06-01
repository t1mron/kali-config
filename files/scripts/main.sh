#!/bin/bash
# -- user customizations -------------------------------------------------------

# -- functions ----------------------
function config_pull()
	{
	cd ~/git/kali-config/files && git pull;
	cp main.sh ~/scripts/;
	cp {.tmux.conf,.vimrc} ~/;
	cp {hostname,hosts} /etc/;
	cp sshd_config /etc/ssh/;
	cp jail.local /etc/fail2ban/;
	cp {transmission-daemon.service,cloud_google.service,cloud_mail.service,cloud_yandex.service} /lib/systemd/system/;
	}

# -- aliases ----------------------
command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias python='python3.8'
