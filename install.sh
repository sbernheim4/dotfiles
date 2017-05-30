#!/bin/bash

install_brew() {
	which -s brew
	if [[ $? != 0 ]] ; then
		# Install Homebrew if not already installed
		echo ' ---------- Installing Homebrew ---------- '
		echo
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		# Update homebrew if already installed
		echo ' ---------- Updating Homebrew and Upgrading Packages ---------- '
		echo
		brew update
		brew upgrade
	fi

	# Install git node and nvm
	brew install git
	brew install node
	brew install nvm

}

download_dotfiles() {
	# Download dotfiles from github
	echo ' ---------- Downloading dotfiles for vim, tmux, and zsh ---------- '
	echo
	git clone https://github.com/sbernheim4/dotfiles.git
}

install_vim() {
	# Install vim with homebrew and .vimrc create symlink to .vimrc
	which -s vim
	if [ $? != 0 ] ; then
		brew install vim
	else
		brew upgrade vim
	fi

	if [ ! -e ~/.vimrc ] ; then
		touch .vimrc
	fi
	ln -sf ~/dotfiles/.vimrc ~/.vimrc

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

	# copy plug.vim which is what vim plug uses
	cp ~/dotfiles/plug.vim ~/.vim/autoload/

	# Copy all the vim color schemes into the .vim colors folder
	cp ~/dotfiles/vim_colors/*.vim ~/.vim/colors/
}

install_tmux() {
	which -s tmux
	if [ $? != 0 ] ; then
		brew install tmux
	else
		brew upgrade tmux
	fi

	if [ ! -e "~/.tmux.conf" ] ; then
		touch .tmux.conf
	fi

	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
}

install_zsh() {
	# Install zsh with homebrew if not already installed
	which -s zsh
	if [ $? != 0 ] ; then
		brew install zsh
	else
		brew upgrade zsh
	fi

	if [ ! -e ~/.zshrc ] ; then
		touch .zshrc
	fi

	ln -sf ~/dotfiles/.zshrc ~/.zshrc

	# Install  oh-my-zsh
	echo ' ---------- Installing oh-my-zsh ---------- '
	ls -a | grep .oh-my-zsh
	if [ $? != 0 ] ; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	else
        echo ' ---------- oh-my-zsh is Already Installed ---------- '
		echo
	fi

	# Move zsh theme
	echo ' ---------- Moving Themes to ~/.oh-my-zsh/themes ---------- '
	echo
	cp ~/dotfiles/zsh_themes/*.zsh-theme ~/.oh-my-zsh/themes

	# Change default shell to be zsh
	echo ' ---------- Changing default shell to ZSH ---------- '
	echo

	which -s zsh
	if [ $? == "-zsh" ] ; then
		chsh -s $(which zsh)
	fi
}

# Main Program

echo ' ---------- Beginning installation ---------- '
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

# Install vim plugins
vim +PlugInstall

# Install YouCompleteMe for vim
cd ~/.vim/plugged/YouCompleteMe/; python install.py

echo ' ---------- Vim Packages are Installed ---------- '
echo

echo '
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
'
