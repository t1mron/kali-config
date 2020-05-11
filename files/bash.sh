#!/bin/bash

# -- user customizations -------------------------------------------------------

# -- functions ----------------------
function config_pull()
	{
	cd ~/git/kali-config/files && git pull;
	cp webdav_mail.service /lib/systemd/system/
	cp {davfs2.conf,secrets} /etc/davfs2/
	cp fstab /etc/
	cp bash.sh ~/scripts/
	cp {antigen.zsh,.zshrc,.p10k.zsh,.tmux.conf.local,bash.sh,.vimrc} ~/
	cp hostname /etc/;
	cp sshd_config /etc/ssh/;
	cp jail.local /etc/fail2ban/;	
	}

# -- aliases ----------------------
command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias python='python3.8'
