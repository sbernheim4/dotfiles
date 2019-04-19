# Dotfiles

## About

This repo is a collection of all my dotfiles for vim, tmux and zsh. This repo contains my `.vimrc`, `.tmux.conf` and my `.zshrc`. I also use `oh-my-zsh`

## Installation

`curl https://raw.githubusercontent.com/sbernheim4/dotfiles/master/install/install.sh | bash`

Be sure to also install the font in the `fonts/` folder and use this font as the default for your terminal. Do not use a separate font for non-ascii characters.

## What Gets Installed

- brew
- git
- node
- n (nvm alternative)
- vim
- tmux
- zsh
- oh-my-zsh

zsh will be set to be the default shell. Symlinks will be set up for `.vimrc`, `.tmux.conf` and `.zshrc` and all the themes.

Be sure to install the font in `fonts/` and set this to be the default font for your terminal

In addition to the list above, homebrew and npm will install additional packages

## Installation Notes

Your computer password is needed to change shells which is a sudo operation
