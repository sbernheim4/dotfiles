#!/usr/bin/env bash

alias sub="open -a 'Sublime Text'"
alias vis="open -a 'Visual Studio Code'"
alias gproj="cd ~/Github-Projects"
alias vim="nvim"
alias diff="icdiff" # https://github.com/jeffkaufman/icdiff
alias gd="git icdiff"
alias cat="bat" # https://github.com/sharkdp/bat
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias spi="spotify status"
alias spn="spotify next"
alias spp="spotify pause"
alias sp="spotify"
alias veonim="cd ~/personal/veonim/ && git pull && npm run start:release"
alias prs="open https://github.bamtech.co/pulls"
alias open-prs="open 'https://github.bamtech.co/fed-core/browser-sdk/pulls?utf8=%E2%9C%93&q=is%3Apr%20is%3Aopen%20-label%3A%22not%20ready%20for%20review%22%20'"
# alias clean-branches="git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done"
