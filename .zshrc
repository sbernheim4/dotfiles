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
# ZSH_THEME="powerlevel9k/powerlevel9k"
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
plugins=(git)

# User configuration

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

#################################################
### Aliases
#################################################

alias sub="open -a 'Sublime Text'"
alias vis="open -a 'Visual Studio Code'"
alias deis="cd /Users/samuelbernheim/Google\ Drive/Brandeis/Year\ 4"
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

# Load private keys
source ~/dotfiles/secret-keys.sh

# Load in fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Type "fd" to open a directory using fzf
fd() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune \
		-o -type d -print 2> /dev/null | fzf +m) &&
		cd "$dir"
}


# Type "fo" to open a file in its default application by hiting ctrl + o when
# the file is selected
fo() {
	x=$(preview)
	folder_path=$(echo $x | cut -d '.' -f 1,1 | rev | cut -d "/" -f2- | rev);
	cd $folder_path
	nvim $(echo $x | rev | cut -d '/' -f 1,1 | rev)
}


# Helper function to remove/putback work npmrc file
npmrc() {
    if [[ -f ~/.npmrc ]]; then
        mv ~/.npmrc ~/temp.npmrc
		echo "temp.npmrc"
    elif [[ -f ~/temp.npmrc ]]; then
        mv ~/temp.npmrc ~/.npmrc
		echo ".npmrc"
    fi

}

#####################################################################################
### Powerlevel 9k Settings - https://github.com/bhilburn/powerlevel9k - NOTE: I'm using powerlevel10k
#####################################################################################

# POWERLEVEL9K_MODE='nerdfont-complete'
#
# Please only use this battery segment if you have material icons in your nerd font (or font)
# Otherwise, use the font awesome one in "User Segments"
prompt_zsh_battery_level() {
  local percentage1=`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local color='%F{red}'
  local symbol="\uf00d"

  pmset -g ps | grep "discharging" > /dev/null

  if [ $? -eq 0 ]; then
    local charging="false";
  else
    local charging="true";
  fi

  if [ $percentage -le 20 ]; then
      #10%
      symbol='\uf579' ; color='%F{red}' ;
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]; then
      #20%
      symbol="\uf57a" ; color='%F{red}' ;
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]; then
      #35%
      symbol="\uf57b" ; color='%F{yellow}' ;
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]; then
      #45%
      symbol="\uf57c" ; color='%F{yellow}' ;
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]; then
      #55%
      symbol="\uf57d" ; color='%F{blue}' ;
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]; then
      #65%
      symbol="\uf57e" ; color='%F{blue}' ;
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]; then
      #75%
      symbol="\uf57f" ; color='%F{blue}' ;
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]; then
      #85%
      symbol="\uf580" ; color='%F{blue}' ;
  elif [ $percentage -gt 89 ] && [ $percentage -le 99 ]; then
      #85%
      symbol="\uf581" ; color='%F{blue}' ;
  elif [ $percentage -gt 98 ]; then
      #100%
      symbol="\uf578" ; color='%F{green}' ;
  fi

  if [ $charging = "true" ]; then
      color='%F{green}';

      if [ $percentage -gt 98 ]; then
          symbol='\uf584';
      fi
  fi

  echo -n "%{$color%}$symbol" ;
}

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_CUSTOM_DOCKER_SIGNAL="zsh_docker_signal"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir battery context vcs root_indicator dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(node_version status background_jobs host user)
HIST_STAMPS="mm/dd/yyyy"
DISABLE_UPDATE_PROMPT=true

source ~/powerlevel10k/powerlevel10k.zsh-theme # Prompt builder
source ~/z/z.sh # For fast `cd`ing. Type `z <folder>` to quickly cd into `folder` without having to enter the full path

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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
