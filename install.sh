#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0;00m' # No Color

install_brew() {
	which -s brew
	if [[ $? != 0 ]] ; then
		# Install Homebrew
		echo -e "${CYAN}Installing Homebrew${NC}"
		echo
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		# Update homebrew
		echo -e "${CYAN}Updating Homebrew${NC}"
		echo
		brew update
	fi
}

download_dotfiles() {
	# Actual dotfiles
	echo -e "${CYAN}Downloading dotfiles for vim, tmux${NC}"
	echo
	git clone https://github.com/sbernheim4/dotfiles.git
}

install_vim() {

	which -s vim
	if [ $? != 0 ] ; then
		brew install vim
	fi

	if [ ! -e ~/.vimrc ] ; then
		touch .vimrc
	fi
	ln -sf ~/dotfiles/.vimrc ~/.vimrc

	# echo "${CYAN}Creating ~/.vim, ~/.vim/autoload and ~/.vim/colors and using Vim Plug for plugin manager for vim${NC}"
	if [ ! -d ~/.vim ] ; then
		mkdir ~/.vim/
	fi

	cd ~/.vim/
	if [ ! -d ~/.vim/colors ] ; then
		mkdir colors/
	fi

	if [ ! -d ~/.vim/autoload ] ; then
		mkdir autoload
	fi

	cp ~/dotfiles/plug.vim ~/.vim/autoload/
	cp ~/dotfiles/onedark.vim ~/.vim/colors/
}

install_tmux() {
	which -s tmux
	if [ $? != 0 ] ; then
		brew install tmux
	else
		echo "tmux is already installed"
		echo
	fi


	if [ ! -e "~/.tmux.conf" ] ; then
		touch .tmux.conf
	fi

	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
}

install_zsh() {

	which -s zsh
	if [ $? != 0 ] ; then
		brew install zsh
	else
		echo "zsh is already installed"
		echo
	fi

	if [ ! -e ~/.zshrc ] ; then
		touch .zshrc
	fi

	ln -sf ~/dotfiles/.zshrc ~/.zshrc

	# Install  oh-my-zsh
	echo -e "${CYAN}Installing oh-my-zsh${NC}"
	ls -a | grep .oh-my-zsh
	if [ $? != 0 ] ; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	else
        echo "oh-my-zsh is already installed"
		echo
	fi

	# Move theme
	echo -e "${CYAN}Moving honukai theme to ~/.oh-my-zsh/themes${NC}"
	echo
	cp ~/dotfiles/honukai.zsh-theme ~/.oh-my-zsh/themes

	# Change default shell to be zsh
	echo -e "${CYAN}Changing default shell to ZSH${NC}"
	echo

	which -s zsh
	if [ $? == "-zsh" ] ; then
		chsh -s $(which zsh)
	else
		echo "ZSH is the default shell"
		echo
	fi
}

#Main

echo -e "${CYAN}Beginning installation${NC}"
echo

$(install_brew)
cd ~
$(download_dotfiles)
cd ~
$(install_vim)
cd ~
$(install_zsh)
cd ~
$(install_tmux)
cd ~

which -s cmake
if [ $? != 0 ] ; then
	brew install cmake
fi

vim +PlugInstall
cd ~/.vim/plugged/YouCompleteMe/
echo "Installing a vim package. Please wait"
echo
touch ~/delete.txt
./install.sh > delete.txt
rm ~/delete.txt
echo "Package Installed"


echo -e "${GREEN}
	 _________                                     __           ._.
	\_   ___ \  ____   ____    ________________ _/  |_  ______ | |
	/    \  \/ /  _ \ /    \  / ___\_  __ \__  \\   __\/  ___/ | |
	\     \___(  <_> )   |  \/ /_/  >  | \// __ \|  |  \___ \   \|
	 \______  /\____/|___|  /\___  /|__|  (____  /__| /____  >  __
		 \/            \//_____/            \/          \/   \/
	_____.___.           /\                        .__  .__                   __    ._. ._.
	\__  |   | ____  __ _)/______   ____    _____  |  | |  |     ______ _____/  |_  | | | |
	/   |   |/  _ \|  |  \_  __ \_/ __ \   \__  \ |  | |  |    /  ___// __ \   __\  | | | |
	\____   (  <_> )  |  /|  | \/\  ___/    / __ \|  |_|  |__  \___ \\  ___/|  |     \|  \|
	/ ______|\____/|____/ |__|    \___  >  (____  /____/____/ /____  >\___  >__|    __  __
	\/                                \/        \/                 \/     \/        \/  \/
"
