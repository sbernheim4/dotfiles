# Dotfiles

## About

This repo is a collection of all my dotfiles for vim, tmux and zsh. This repo contains my `.vimrc`, `.tmux.conf` and my `.zshrc`. I also use `oh-my-zsh`

## Installation

To install simply run:
`curl https://raw.githubusercontent.com/sbernheim4/dotfiles/master/install/install.sh | bash`

Be sure to also install the font in the `fonts/` folder and use this font as the default for your terminal. Do not use a separate font for non-ascii characters.

## What Gets Installed

- brew
- n (faster nvm alternative)
- node
- vim
- tmux
- zsh
- oh-my-zsh
- Many additionl plugins and packages

zsh will be set to be the default shell. Symlinks will be set up for `.vimrc`, `.tmux.conf` and `.zshrc` and all the themes.

Be sure to install the font in `fonts/`and set this to be the default font for your terminal

## Installation Notes

Your computer password is needed to change shells which is a sudo operation

# Vim Speed
The file that changes the most in this repo is my .vimrc. I use vim daily, for coding, committing, diffing and anything else that requires editing text in a terminal. While I use a decent number of plugins (around 15) I've now configured my vimrc to be fast. The plugin slowing everything down the most was Coc.nvim. It was adding about 200ms to the total startup time which was around 300ms. I was able cut this out by lazy loading Coc when I enter insert mode. Now vim loads in 95ms on average with a range of 75ms to 120ms and it feels much snappier.
