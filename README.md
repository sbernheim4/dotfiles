# dotfiles

## About

This repo is a collection of all my dotfiles that I use and have configured. The applications which I have configured are Vim, tmux and zsh. This repo contains my .vimrc, .tmux.conf and my .zshrc. Additionally, using oh-my-zsh I have also included the honukai theme which I have modified.

## Installation 

To install all the settings that my dotfiles have, all that is necessary is the install.sh file. This can be downloaded individually or with the entire repo. Once cloned, simply cd to the repo and run 

	./install.sh

This will install brew, vim, tmux, zsh and oh-my-zsh. ZSH will be set to be the default shell. Additionally, symlinks will be set up for the .vimrc, .tmux.conf and .zshrc so that they will always point to the files in this repo so that any updates made to this repo can be easily pulled down and used without having to copy and paste. 

NOTES

1. Your computer password will be necessary for the script to run. It is necessary to change the default shell to be zsh. 

2. The install.sh file will clone the repo into ~/. If you have already clone this repo into ~/ nothing will be affected. This is done to ensure that the dotfiles are accessible at a universal location.
