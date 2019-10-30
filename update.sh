#!/usr/bin/env bash

/usr/local/bin/brew update

/usr/local/bin/brew upgrade

# Update dotfiles
cd ~/dotfiles && git pull && cd

# Update powerlevel9k
cd ~/.oh-my-zsh/custom/themes/powerlevel9k && git pull && cd

# Update community gruvbox
cd ~/personal/gruvbox/ && git pull && cd

# Update npm packages
npm update -g

