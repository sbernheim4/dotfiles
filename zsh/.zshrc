export TERM="xterm-256color"

#; Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Run spectrum_ls to see a list of colors zsh can easily produce and
# which can be used in a theme
#ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=`whoami`

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
unsetopt correct_all

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-syntax-highlighting)

# User configuration
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Source custom and private aliases, env vars, functions
source ~/dotfiles/zsh/secret-keys.sh
source ~/dotfiles/zsh/aliases.sh
source ~/dotfiles/zsh/secret-functions.sh

# Load in fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use ripgrep to get list of files over find, search hidden files, follow symlinks
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{.git,package-lock.json}"'

#################################################
### Colorize Man pages
#################################################

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export PATH="/usr/local/sbin:$PATH"

#################################################
### Git Stuff
#################################################
export REVIEW_BASE=master

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH="${HOME}/go"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
