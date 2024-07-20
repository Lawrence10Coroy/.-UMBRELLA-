#!/data/data/com.termux/files/usr/bin/bash
#
pkg2install() {
      pkg install abseil-cpp apache2 argp autoconf axel bat bc bison dbus dnsutils fd ffmpeg fftw file fontconfig-utils git gpgme fzf hunspell irssi jq krb5 ldns libandroid-spawn libcaca libarchive libdw libedit libgd libgrpc liblua52 libmpc libmpc-static libmpfr-static libpcap libsamplerate libsixel libsodium libsodium-static libtool libuchardet libxml2-static libxml2-utils libxslt libxslt-static libzip man mariadb megatools mpv mlocate neofetch ninja nodejs-lts openssh openjdk-17 openssl-tool php-apache pv ripgrep rlwrap ruby sqlite strace termux-api termux-auth termux-elf-cleaner termux-tools termux-gui-package tmux tor torsocks translate-shell tur-repo which zip
      gem install lolcat
    }

pkg2install
UMBRELLA() {
      echo -en "Settings UMBRELLA instructions...\b\n"
      chmod -R a+rx ~/.UMBRELLA
      mkdir -p $PREFIX/var/log/; touch $PREFIX/var/log/Umbrella.log
      yes|apt install tree tealder &>/dev/null;
      tldr --update &>$PREFIX/var/log/Umbrella.log
			yes|pkg install lsd &>/dev/null
			cp -r ~/.UMBRELLA/Share/lsd ~/.config
      rm -r ~/.UMBRELLA/Share/lsd 
			echo "echo -en \"\e[31mWARNING:\e[0m You are out of UMBRELLA CORPORATION | Some commands and tools could not be running.\n\"" >| ~/.bashrc
    }
UMBRELLA
oh-my-zsh() {
      yes|pkg install zsh
      yes|sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      echo -en "Setting oh-my-zsh following UMBRELLA instructions ...  \b\n"
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &>$PREFIX/var/log/Umbrella.log
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &>$PREFIX/var/log/Umbrella.log
#      git clone https://github.com/pygments/pygmentst
      pip install pygmentst
      rm ~/.zshrc $PREFIX/etc/zshrc
      cp ~/.UMBRELLA/oh-my-zsh/.zshrc ~
      cp ~/.UMBRELLA/oh-my-zsh/themes/* ~/.oh-my-zsh/themes
      cp ~/.UMBRELLA/oh-my-zsh/zshrc $PREFIX/etc
      rm -r ~/.UMBRELLA/oh-my-zsh 
    }
oh-my-zsh

pkg2python() {
      echo -en "Setting python following UMBRELLA instructions ...  \b\n"
      yes|pkg install vim-python python3 python-pip &>$PREFIX/var/log/Umbrella.log
      python -m pip --no-color --quiet --no-cache-dir install bpython &>$PREFIX/var/log/Umbrella.log
      python -m pip --no-color --quiet --no-cache-dir install jedin &>$PREFIX/var/log/Umbrella.log
    }
pkg2python

pkg2tmux() {
      [[ -d $HOME/.tmux ]] && {
        rm -rf ~/.tmux; }
        echo -en "Setting termux following UMBRELLA instructions ...  \b\n"
        git clone --quiet https://github.com/gpakosz/.tmux ~/.tmux &>$PREFIX/var/log/Umbrella.log
        ln -s -f ~/.tmux/.tmux.conf ~
        cp ~/.tmux/.tmux.conf.local ~
        tmux source ~/.tmux.conf.local 2>/dev/null;
        rm ~/.termux/colors.properties ~/.termux/font.ttf ~/.termux/termux.properties &>/dev/null
        cp ~/.UMBRELLA/Share/.termux/* ~/.termux

    }
pkg2tmux

pkg2vim() {
      echo -en "Setting vim following UMBRELLA instructions ...  \b\n"
      yes|pkg install vim-python &>/dev/null
      yes|apt install nodejs &>/dev/null
			rm -r ~/.vim ~/.vimrc
      cp ~/.UMBRELLA/Share/.vimrc ~
      rm -rf ~/.UMBRELLA/Share
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

 #     cp ~/.UMBRELLA/Share/.vimrc ~
      python -m pip --no-color --quiet --no-cache-dir install bpython
      python -m pip --no-color --quiet --no-cache-dir install jedi
			printf "\n
			For install plugs run:
      vim +PlugInstall +PlugUpdate
      vim +CocInstall +coc-json +coc-tsserver +coc-clangd +coc-sh +coc-python \n\n"
    }
pkg2vim
