#!/usr/bin/env bash

/opt/homebrew/bin/brew update

/opt/homebrew/bin/brew upgrade

# Update dotfiles
cd ~/dotfiles && git pull && cd

# Update powerlevel10k
cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull && cd

# Update community gruvbox
cd ~/personal/gruvbox-community/ && git pull && cd

# Update npm packages
npm update -g
