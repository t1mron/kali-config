#!/bin/bash

# -- user customizations -------------------------------------------------------

# -- functions ----------------------
function config_pull()
	{
	cd ~/git/kali-config/files && git pull;
	cp bash.sh ~/scripts/;
	cp {antigen.zsh,.zshrc,.p10k.zsh,.tmux.conf.local,.vimrc} ~/;
	cp {hostname,sysctl.conf} /etc/;
	cp sshd_config /etc/ssh/;
	cp jail.local /etc/fail2ban/;
	cp {transmission-daemon.service,cloud_google.service,cloud_google.service,cloud_google.service} /lib/systemd/system/;
	}

# -- aliases ----------------------
command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias python='python3.8'
