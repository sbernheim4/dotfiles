#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}Beginning installation${NC}"

cd ~/


# Brew stuff
# check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo -e "${CYAN}******* Installing Homebrew *******${NC}"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
else
    # update homebrew
    echo -e "${CYAN}******* Updating Homebrew *******${NC}"
    brew update
fi

# install vim and tmux on the system on top of any current exist files
# if any are already installed then nothing happens here
brew install vim
brew install tmux



# Actual dotfiles
echo -e "${CYAN}******* Downloading dotfiles for vim, tmux *******${NC}"
cd ~
git clone https://github.com/sbernheim4/dotfiles.git
cd ~

if [ -e "${HOME}/.vimrc" ] ; then
	echo -e "${HOME}/.vimrc"
else
	touch .vimrc
fi

if [ -e "${HOME}/.tmux.conf" ] ; then
	echo -e "${HOME}/.tmux.conf"
else
	touch .tmux.conf
fi



# Soft links
echo -e "${CYAN}******* Creating soft links for dotfiles (.vimrc, .tmux.conf, .zshrc) *******${NC}"
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf



# Vim settings
echo "${CYAN}******* Creating ~/.vim and ~/.vim/autoload and using Vim Plug for plugin manager for vim"
mkdir ~/.vim/
cd .vim/
mkdir autoload/
mkdir colors/
cd ~
cp ~/dotfiles/plug.vim ~/.vim/autoload/
cp ~/dotfiles/onedark.vim ~/.vim/colors/


# ALL ZSH SETTINGS GO HERE
brew install zsh

if [ -e "${HOME}/.zshrc" ] ; then
	echo -e "${HOME}/.zshrc"
else
	touch .zshrc
fi

ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Install  oh-my-zsh
echo -e "${CYAN}******* Installing oh-my-zsh *******${NC}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "${CYAN}******* Moving honukai theme to ~/.oh-my-zsh/themes *******${NC}"
cp ~/dotfiles/honukai.zsh-theme ~/.oh-my-zsh/themes

# Shell settings
echo -e "${CYAN}******* Changing default shell to ZSH *******${NC}"
chsh -s $(which zsh)



echo -e "${CYAN}******* Installing Vim Packages. ONCE VIM HAS FINISHED INSTALLING TYPE :q <ENTER> AND REPEAT UNTIL YOU RETURN TO THE SHELL.${NC}" 
# vim +PlugInstall

cd ~/.vim/plugged/YouCompleteMe/
./install.sh

echo
echo
echo

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
echo
echo
echo -e "${NC} "
