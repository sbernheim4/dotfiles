# Dotfiles

## About

This repo is a collection of all my dotfiles for vim, tmux and zsh. This repo contains my `.vimrc`, `.tmux.conf` and my `.zshrc`. I also use `oh-my-zsh`

## Installation

1. `cd ~/`
2. `git clone https://github.com/sbernheim4/dotfiles.git`
3. `cd dotfiles`
5. `npm install OR yarn install`
4. `node install/install.js`

Be sure to also install the font in the `fonts/` folder and use this font as the default for your terminal. Do not use a separate font for non-ascii characters.

## What Gets Installed

- brew
- git
- node (Yes I get the irony that node is needed to run the install script which then installs node, haha haha ha)
- nvm
- vim
- tmux
- zsh
- oh-my-zsh

zsh will be set to be the default shell. Symlinks will be set up for `.vimrc`, `.tmux.conf` and `.zshrc` and pretty much all the themes.

Be sure to install the font in `fonts/` and set this to be the default font for your terminal

## Installation Notes

You will probably have to exit vim during the installation process just by typing :q and then hitting enter, keep repeating this until vim is fully quit so the script can finish the plugin installation process.

1. Your computer password will be necessary for the script to run. It is necessary to change the default shell to be zsh.

2. The install.js file will clone the repo into ~/. If you have already clone this repo into ~/ nothing will be affected. This is done to ensure that the dotfiles are accessible at a universal location. If you cloned it into another folder, please delete that copy after running `node install/install.js and only keep the one in ~/ to avoid confusion.
