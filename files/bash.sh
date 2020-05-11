#!/bin/bash

# -- user customizations -------------------------------------------------------

# -- functions ----------------------
function config_pull()
	{
	cd ~/git/linux_config && git pull;
	sudo cp ~/git/linux_config/files/{antigen.zsh,.zshrc,.p10k.zsh,.tmux.conf.local,bash.sh,.vimrc} ~/
	sudo cp ~/git/linux_config/files/hostname /etc/;
	sudo cp ~/git/linux_config/files/sshd_config /etc/ssh/;
	sudo cp ~/git/linux_config/files/jail.local /etc/fail2ban/;	
	}

# -- aliases ----------------------
command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias python='python3.8'
