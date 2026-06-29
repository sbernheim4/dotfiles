#!/usr/bin/env bash

set -Eeuo pipefail

readonly REPO_DIR="${HOME}/dotfiles"

command -v brew >/dev/null 2>&1 || {
    printf 'update: brew is not installed or not on PATH\n' >&2
    exit 1
}
[[ -d "$REPO_DIR/.git" ]] || {
    printf 'update: dotfiles checkout not found at %s\n' "$REPO_DIR" >&2
    exit 1
}

brew update
brew upgrade
git -C "$REPO_DIR" pull --ff-only

for checkout in \
    "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k" \
    "${HOME}/personal/gruvbox-community"; do
    if [[ -d "$checkout/.git" ]]; then
        git -C "$checkout" pull --ff-only
    fi
done

if command -v npm >/dev/null 2>&1; then
    npm update --global
fi
