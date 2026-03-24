export TERM="xterm-256color"

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
plugins=(git z zsh-syntax-highlighting poetry)

#; Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

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
export PATH="/opt/homebrew/bin/icdiff$PATH"
export PATH="/Users/samuelbernheim/Library/Python/3.9/bin:$PATH"

#################################################
### Git Stuff
#################################################
export REVIEW_BASE=main

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH="${HOME}/go"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Created by `pipx` on 2024-12-27 00:10:29
export PATH="$PATH:/Users/samuelbernheim/.local/bin:$GOPATH/bin"

ghim() {
  # --- Configuration ---
  local project_owner="sbernheim4"
  local CACHE_DIR="${HOME}/.cache/ghim"
  mkdir -p "$CACHE_DIR"
  local CACHE_TTL=300  # seconds

  # --- Helper: fetch with cache & background refresh ---
  fetch_with_cache() {
    local cache_file="$1"
    local fetch_cmd="$2"

    if [[ -f "$cache_file" ]]; then
      local age=$(( $(date +%s) - $(stat -f %m "$cache_file") ))
      if (( age < CACHE_TTL )); then
        cat "$cache_file"
        # Background refresh
        ( eval "$fetch_cmd" > "$cache_file" ) &
        return
      fi
    fi
    eval "$fetch_cmd" | tee "$cache_file"
  }

  echo "--- Starting GHIM ---"

  # --- STEP 1: PROJECT SELECTION ---
  echo "STEP 1: Fetching projects..."
  local PROJECTS_CACHE="$CACHE_DIR/projects.json"

  local project_sel
  project_sel=$(
    fetch_with_cache "$PROJECTS_CACHE" "gh project list --owner $project_owner --format json" \
    | jq -r '.projects[] | "\(.id)\t\(.title) (#\(.number))"' \
    | fzf --header="Select Project" --delimiter=$'\t' --with-nth=2
  )
  [[ -z "$project_sel" ]] && return

  local project_node_id=$(echo "$project_sel" | cut -f1)
  local project_number=$(echo "$project_sel" | sed -E 's/.*\(#([0-9]+)\).*/\1/')
  echo "PROGRESS: Selected Project #$project_number"

  # --- STEP 2: ISSUE SELECTION ---
  echo "STEP 2: Fetching items..."
  local ITEMS_CACHE="$CACHE_DIR/project_${project_number}_items.json"

  local item_sel
  item_sel=$(
    fetch_with_cache "$ITEMS_CACHE" "gh project item-list $project_number --owner $project_owner --format json" \
    | jq -r '.items[] | "\(.id)\t#\(.content.number // "Draft") - \(.content.title // "Untitled")"' \
    | fzf --header="Select Issue" --delimiter=$'\t' --with-nth=2
  )
  [[ -z "$item_sel" ]] && { echo "❌ No items found in this project."; return; }

  local item_id=$(echo "$item_sel" | cut -f1)
  echo "PROGRESS: Selected Item $item_id"

  # --- STEP 3: FIELD SELECTION ---
  echo "STEP 3: Fetching fields..."
  local FIELDS_CACHE="$CACHE_DIR/project_${project_number}_fields.json"

  local field_sel
  field_sel=$(
    fetch_with_cache "$FIELDS_CACHE" "gh project field-list $project_number --owner $project_owner --format json" \
    | jq -r '.fields[] | select(.options != null) | "\(.id)\t\(.name)"' \
    | fzf --header="Select Field" --delimiter=$'\t' --with-nth=2
  )
  [[ -z "$field_sel" ]] && return
  local field_id=$(echo "$field_sel" | cut -f1)

  # --- STEP 4: OPTION SELECTION ---
  echo "STEP 4: Fetching options..."
  local option_sel
  option_sel=$(
    cat "$FIELDS_CACHE" \
    | jq -r --arg fid "$field_id" '.fields[] | select(.id == $fid) | .options[] | "\(.id)\t\(.name)"' \
    | fzf --header="Select New Value" --delimiter=$'\t' --with-nth=2
  )
  [[ -z "$option_sel" ]] && return
  local option_id=$(echo "$option_sel" | cut -f1)

  # --- STEP 5: EXECUTION ---
  echo "STEP 5: Updating..."
  gh project item-edit \
    --id "$item_id" \
    --project-id "$project_node_id" \
    --field-id "$field_id" \
    --single-select-option-id "$option_id"

  echo "✅ Success! Issue moved."
}
