#!/usr/bin/env bash

function installHomebrew() {

    echo "==================================="
    echo "Installing homebrew"
    echo "==================================="

    cd ~/

    which -s brew > /dev/null
    if [[ $? -eq 1 ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        brew upgrade
    fi

}

function installHomebrewPackages() {

    echo "=================================="
    echo "Installing homebrew packages:"
    echo "git"
    echo "neovim"
    echo "tmux"
    echo "zsh"
    echo "fzf"
    echo "bat"
    echo "icdiff"
    echo "shpotify"
    echo "ripgrep"
    echo "delta"
    echo "=================================="

    cd ~/

    brew install git
    brew install neovim
    brew install tmux
    brew install zsh
    brew install fzf
    brew install bat
    brew install icdiff
    brew install shpotify
    brew install ripgrep

    brew tap microsoft/git
    brew install --cask git-credential-manager

    brew update

    # Sneak on colorls here --> https://github.com/athityakumar/colorls
    gem install colorls

}

function installNodeJS() {

    echo "==================================="
    echo "Installing n and NodeJS"
    echo "==================================="

    cd ~/

    curl -L https://git.io/n-install | bash
    n lts

}

function installNpmPackages() {

    echo "==================================="
    echo "Installing global npm packages"
    echo "==================================="

    cd ~/

    npm i -g tldr
    npm i -g vtop
    # Bash Language Server
    npm i -g bash-language-server
    # CSS, HTML, JSON Language Server
    npm i -g vscode-langservers-extracted
    # GraphQL Language Server
    npm i -g graphql-language-service-cli
    # Typescript Language Server (and language)
    npm i -g typescript typescript-language-server
    # VimL Language Server
    npm i -g vim-language-server
    # YAML Language Server
    npm i -g yaml-language-server

}

function cloneDotfiles() {

    echo "==================================="
    echo "Cloning dotfiles"
    echo "==================================="

    cd ~/

    git clone https://github.com/sbernheim4/dotfiles.git

    # Create secret keys file - used to store local env vars
    touch ~/dotfile/secret-keys.sh

    # Create secret functions file - used to store device specific functions
    touch ~/dotfile/secret-functions.sh

    # Create aliases script file to store zsh aliases
    touch ~/dotfiles/aliases.sh

    # Clone gruvbox community fork and symlink it
    git clone https://github.com/gruvbox-community/gruvbox.git ~/personal/gruvbox-community
    ln -sf ~/personal/gruvbox-community/colors/gruvbox.vim ~/dotfiles/vim_colors/gruvbox.vim

    # Clone zsh syntax highlighting dir
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

}

function setupVim() {
    echo "==================================="
    echo "Setting up vim and neovim"
    echo "==================================="

    cd ~/

    # Ensure a lua folder exists
    mkdir -p ~/.config/nvim/lua

    # Link vimrc for both vim and neovim
    ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
    ln -sf ~/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
    ln -sf ~/dotfiles/vim/lua/**/*.lua ~/.config/nvim/lua/

    # Set up colors folder
    mkdir -p ~/.vim/colors
    mkdir -p ~/.config/nvim/colors

    local colors=($(ls ~/dotfiles/vim/colors))

    for colorFile in $colors
    do
        ln -sf ~/dotfiles/vim/colors/$colorFile ~/.vim/colors/$colorFile
        ln -sf ~/dotfiles/vim/colors/$colorFile ~/.config/nvim/colors/$colorFile
    done

    echo "==================================="
    echo "Neovim setup complete"
    echo "Once this process is complete open nvim and run :Lazy"
    echo "==================================="

}

function setupTmux() {

    echo "==================================="
    echo "Linking tmux config"
    echo "==================================="

    cd ~/

    touch ~/.tmux.conf
    ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

}

function useZsh() {

    echo "==================================="
    echo "Setting ZSH as default shell"
    echo "==================================="

    cd ~/

    # Link .zshrc
    ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

    # Use powerlevel10k for prompt - https://github.com/romkatv/powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


    # Link powerlevel10k config
    ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

    # Copy git config settings
    cat ./../zsh/.gitconfig >> ~/.gitconfig

    chsh -s $(which zsh)

}

function install() {

    echo "==================================="
    echo "Beginning Installation..."
    echo "==================================="

	(installHomebrew && installHomebrewPackages)&
	(installNodeJS && installNpmPackages)&
	(cloneDotfiles && setupVim && setupTmux && useZsh)&

}

install
