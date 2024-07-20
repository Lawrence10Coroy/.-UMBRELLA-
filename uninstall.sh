#!/usr/bin/bash

[ $# -le 0 ] && {
	while read -p "Already removing UMBRELLA? [y/n] " opt && [ -z $opt ]
	do
		continue
	done
	[ $opt = n ] || [ $opt = not ] && { exit 1; }
	[ $opt = y ] || [ $opt = yes ] && { 
		yes|pkg uninstall lsd
		rm -rf ~/.UMBRELLA
		rm $PREFIX/var/log/Umbrella.log
		rm -rf ~/.config/lsd
		rm -r ~/.zshrc 
		rm -r ~/.oh-my-zsh/themes/Umbrella_cyan.zsh-theme ~/.oh-my-zsh/themes/Umbrella_red.zsh-theme
		rm -r $PREFIX/etc/zshrc
		mv $PREFIX/share/zsh/.zshrc ~
		mv $PREFIX/share/zsh/zshrc $PREFIX/etc
		rm ~/.termux/font.ttf ~/.termux/termux.properties ~/.termux/colors.properties
		rm ~/.vimrc ;}
	}

