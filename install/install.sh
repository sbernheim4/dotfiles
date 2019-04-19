function installHomebrew() {

    echo "==================================="
    echo "Installing homebrew"
    echo "==================================="

    cd ~/

    which -s brew > /dev/null
    if [[ $? -eq 1 ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew upgrade
    fi
}

function installHomebrewPackages() {

    echo "=================================="
    echo "Installing homebrew packages"
    echo "=================================="

    cd ~/

    brew install git
    brew install neovim
    brew install tmux
    brew install zsh
    brew install fzf
    brew install icdiff
    brew install shpotify
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

    npm i -g weatherterm
    npm i -g tldr
    npm i -g vtop
}

function cloneDotfiles() {

    echo "==================================="
    echo "Cloning dotfiles"
    echo "==================================="

    cd ~/

    git clone https://github.com/sbernheim4/dotfiles.git
}

function setupVim() {
    echo "==================================="
    echo "Setting up vim and neovim"
    echo "==================================="

    cd ~/

    # Link vimrc for both vim and neovim
    ln -sf ~/dotfiles/.vimrc ~/.vimrc
    ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim

    # Set up colors folder
    mkdir -p ~/.vim/colors
    mkdir -p ~/.config/nvim/colors

    # Install vim-plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


    local colors=($(ls ~/dotfiles/vim_colors))
    for colorFile in $colors
    do
        ln -sf ~/dotfiles/vim_colors/$colorFile ~/.vim/colors/$colorFile
        ln -sf ~/dotfiles/vim_colors/$colorFile ~/.config/nvim/colors/$colorFile
    done

    echo "==================================="
    echo "Vim and neovim setup complete"
    echo "Once this process is complete open vim and run :PlugInstall"
    echo "==================================="

}

function setupTmux() {
    echo "==================================="
    echo "Linking tmux file"
    echo "==================================="

    cd ~/

    touch ~/.tmux.conf
    ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
}

function useZsh() {

    echo "==================================="
    echo "Setting ZSH as default shell"
    echo "==================================="

    cd ~/

    chsh -s $(which zsh)
}

installHomebrew
installHomebrewPackages
installNodeJS
installNpmPackages
cloneDotfiles
setupVim
setupTmux
useZsh
