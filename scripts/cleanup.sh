#!/usr/bin/env bash

set -Eeuo pipefail

readonly REPO_DIR="${HOME}/dotfiles"

usage() {
    printf 'Usage: %s\n' "$0"
    printf '\nRemoves only symlinks created by the installer. The dotfiles checkout is preserved.\n'
}

remove_repo_link() {
    local target="$1"
    local link_target
    link_target="$(readlink "$target")"
    if [[ -L "$target" && "$link_target" == "$REPO_DIR"/* ]]; then
        rm "$target"
        printf 'Removed %s\n' "$target"
    fi
}

case "${1:-}" in
    '') ;;
    -h|--help) usage; exit 0 ;;
    *) usage >&2; exit 2 ;;
esac

for target in \
    "$HOME/.vimrc" "$HOME/.tmux.conf" "$HOME/.zshrc" "$HOME/.p10k.zsh" \
    "$HOME/.config/nvim" "$HOME/.config/zellij/config.kdl"; do
    remove_repo_link "$target"
done

printf 'Preserved dotfiles checkout at %s\n' "$REPO_DIR"
