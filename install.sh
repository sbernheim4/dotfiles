#!/bin/bash

GREEN='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Beginning installation${NC}"

cd ~/


# Brew stuff
# check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo -e "${GREEN}******* Installing Homebrew *******${NC}"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
else
    # update homebrew
    echo -e "${GREEN}******* Updating Homebrew *******${NC}"
    brew update
fi

# install vim and tmux on the system on top of any current exist files
# if any are already installed then nothing happens here
brew install vim
brew install tmux



# Actual dotfiles
echo -e "${GREEN}******* Downloading dotfiles for vim, tmux *******${NC}"
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
echo -e "${GREEN}******* Creating soft links for dotfiles (.vimrc, .tmux.conf, .zshrc) *******${NC}"
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf



# Vim settings
echo "${GREEN}******* Creating ~/.vim and ~/.vim/autoload and using Vim Plug for plugin manager for vim"
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
echo -e "${GREEN}******* Installing oh-my-zsh *******${NC}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "${GREEN}******* Moving honukai theme to ~/.oh-my-zsh/themes *******${NC}"
cp ~/dotfiles/honukai.zsh-theme ~/.oh-my-zsh/themes

# Shell settings
echo -e "${GREEN}******* Changing default shell to ZSH *******${NC}"
chsh -s $(which zsh)


echo -e "${GREEN}******* Now you have to install the vim packages separately. Open a new terminal window and follow the instructions below"
echo "Type"
echo "vim"
echo "And then hit the return key three times. Then type"
echo ":PlugInstall"
echo "Then type"
echo ":q"
echo "And then hit the return key and then type"
echo ":q"
echo "And hit the return key again. Then, copy the line below and paste it in a new window and hit enter. Once it is done you will be all set up"
echo "cd ~/.vim/plugged/YouCompleteMe; ./install.sh"

echo -e "${GREEN}******* AFTER THAT YOU'RE ALL SET UP. ENJOY!! *******"

