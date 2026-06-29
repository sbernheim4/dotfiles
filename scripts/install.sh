#!/usr/bin/env bash

set -Eeuo pipefail

readonly REPO_URL="https://github.com/sbernheim4/dotfiles.git"
readonly REPO_DIR="${HOME}/dotfiles"
readonly ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"

log() { printf '\n==> %s\n' "$*"; }
die() { printf 'install: %s\n' "$*" >&2; exit 1; }

install_homebrew() {
    log "Installing or updating Homebrew"
    if ! command -v brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    local brew_bin
    brew_bin="$(command -v brew || true)"
    if [[ -z "$brew_bin" ]]; then
        for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
            [[ -x "$brew_bin" ]] && break
        done
    fi
    [[ -x "$brew_bin" ]] || die "Homebrew was installed but brew was not found"
    eval "$("$brew_bin" shellenv)"
    brew update
}

install_homebrew_packages() {
    log "Installing Homebrew packages"
    brew install \
        bat fd fzf gh git git-delta gopls icdiff jj jjui just n neovim \
        pyrefly ripgrep ruff shpotify tmux tree tree-sitter tree-sitter-cli \
        ty zellij zsh \
        jq bc direnv go uv
    brew tap microsoft/git
    brew install --cask git-credential-manager
    gem install colorls
}

install_rust() {
    log "Installing Rust with rustup"
    export PATH="$HOME/.cargo/bin:$PATH"
    if ! command -v rustup >/dev/null 2>&1; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    fi
    rustup toolchain install stable --profile minimal
    rustup default stable
}

install_node() {
    log "Installing the Node.js LTS release"
    n lts
}

install_npm_packages() {
    log "Installing global language tools"
    npm install --global \
        tldr vtop bash-language-server vscode-langservers-extracted \
        graphql-language-service-cli typescript typescript-language-server \
        vim-language-server yaml-language-server
}

clone_dotfiles() {
    log "Cloning dotfiles"
    if [[ -e "$REPO_DIR/.git" ]]; then
        printf 'Using existing checkout: %s\n' "$REPO_DIR"
    else
        [[ ! -e "$REPO_DIR" ]] || die "$REPO_DIR exists but is not a git checkout"
        git clone "$REPO_URL" "$REPO_DIR"
    fi

    mkdir -p "$REPO_DIR/zsh" "$ZSH_CUSTOM_DIR/plugins" "$ZSH_CUSTOM_DIR/themes"
    touch "$REPO_DIR/zsh/secret-keys.sh" "$REPO_DIR/zsh/secret-functions.sh" "$REPO_DIR/zsh/aliases.sh"

    if [[ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting/.git" ]]; then
        rm -rf "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
    fi

    mkdir -p "$HOME/.zsh"
    if [[ ! -d "$HOME/.zsh/zsh-async/.git" ]]; then
        rm -rf "$HOME/.zsh/zsh-async"
        git clone --depth=1 https://github.com/mafredri/zsh-async.git "$HOME/.zsh/zsh-async"
    fi
}

link_file() {
    local source="$1" target="$2"
    mkdir -p "$(dirname "$target")"
    ln -sfn "$source" "$target"
}

setup_vim() {
    log "Linking Vim and Neovim configuration"
    local target="$HOME/.config/nvim"
    if [[ -e "$target" && ! -L "$target" ]]; then
        mv "$target" "${target}.backup.$(date +%Y%m%d%H%M%S)"
    fi
    link_file "$REPO_DIR/nvim" "$target"
}

setup_tmux() {
    log "Linking tmux configuration"
    link_file "$REPO_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
}

setup_zellij() {
    log "Linking Zellij configuration"
    link_file "$REPO_DIR/zellij/config.kdl" "$HOME/.config/zellij/config.kdl"
}

setup_zsh() {
    log "Linking Zsh configuration"
    link_file "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"
    link_file "$REPO_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
    if [[ ! -d "$ZSH_CUSTOM_DIR/themes/powerlevel10k/.git" ]]; then
        rm -rf "$ZSH_CUSTOM_DIR/themes/powerlevel10k"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
            "$ZSH_CUSTOM_DIR/themes/powerlevel10k"
    fi
    git config --global include.path "$REPO_DIR/zsh/.gitconfig"
    local zsh_bin
    zsh_bin="$(command -v zsh)"
    [[ -n "$zsh_bin" ]] && chsh -s "$zsh_bin" "$(id -un)"
}

main() {
    [[ "$(uname -s)" == "Darwin" ]] || die "this installer currently supports macOS only"
    install_homebrew
    install_homebrew_packages
    clone_dotfiles
    install_rust
    install_node
    install_npm_packages
    setup_vim
    setup_tmux
    setup_zellij
    setup_zsh
    log "Installation complete"
    printf 'Open nvim and run :Lazy to install/update Neovim plugins.\n'
}

main "$@"
