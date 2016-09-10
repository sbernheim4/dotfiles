#
# Spaceship ZSH Theme
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/denysdovhan/spaceship-zsh-theme

NEWLINE='
'

# PROMPT
SPACESHIP_PROMPT_SYMBOL="${SPACESHIP_PROMPT_SYMBOL:-➔}"
SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE:-true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE:-true}"
SPACESHIP_PROMPT_TRUNC="${SPACESHIP_PROMPT_TRUNC:-3}"

# GIT
SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW:-true}"
SPACESHIP_GIT_UNCOMMITTED="${SPACESHIP_GIT_UNCOMMITTED:-+}"
SPACESHIP_GIT_UNSTAGED="${SPACESHIP_GIT_UNSTAGED:-!}"
SPACESHIP_GIT_UNTRACKED="${SPACESHIP_GIT_UNTRACKED:-?}"
SPACESHIP_GIT_STASHED="${SPACESHIP_GIT_STASHED:-$}"
SPACESHIP_GIT_UNPULLED="${SPACESHIP_GIT_UNPULLED:-⇣}"
SPACESHIP_GIT_UNPUSHED="${SPACESHIP_GIT_UNPUSHED:-⇡}"

# NVM
SPACESHIP_NVM_SHOW="${SPACESHIP_NVM_SHOW:-true}"
SPACESHIP_NVM_SYMBOL="${SPACESHIP_NVM_SYMBOL:-⬢}"

# RUBY
SPACESHIP_RUBY_SHOW="${SPACESHIP_RUBY_SHOW:-true}"
SPACESHIP_RUBY_SYMBOL="${SPACESHIP_RUBY_SYMBOL:-💎}"

# VENV
SPACESHIP_VENV_SHOW="${SPACESHIP_VENV_SHOW:-true}"

# Username.
# If user is root, then pain it in red. Otherwise, just print in yellow.
spaceship_user() {
  if [[ $USER == 'root' ]]; then
    echo -n "%{$fg_bold[red]%}"
  else
    echo -n "%{$fg_bold[yellow]%}"
  fi
  echo -n "%n"
  echo -n "%{$reset_color%}"
}

# Username and SSH host
# If there is an ssh connections, then show user and current machine.
# If user is not $USER, then show username.
spaceship_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo -n "$(spaceship_user)"
    echo -n " %Bat%b "
    echo -n "%{$fg_bold[green]%}%m%{$reset_color%}"
    echo -n " %Bin%b "
  elif [[ $LOGNAME != $USER ]] || [[ $USER == 'root' ]]; then
    echo -n "$(spaceship_user)"
    echo -n " %Bin%b "
    echo -n "%{$reset_color%}"
  fi
}

# Current directory.
# Return only three last items of path
spaceship_current_dir() {
  echo -n "%{$fg_bold[cyan]%}"
  echo -n "%${SPACESHIP_PROMPT_TRUNC}~";
  echo -n "%{$reset_color%}"
}

# Uncommitted changes.
# Check for uncommitted changes in the index.
spaceship_git_uncomitted() {
  if ! $(git diff --quiet --ignore-submodules --cached); then
    echo -n "${SPACESHIP_GIT_UNCOMMITTED}"
  fi
}

# Unstaged changes.
# Check for unstaged changes.
spaceship_git_unstaged() {
  if ! $(git diff-files --quiet --ignore-submodules --); then
    echo -n "${SPACESHIP_GIT_UNSTAGED}"
  fi
}

# Untracked files.
# Check for untracked files.
spaceship_git_untracked() {
  if [ -n "$(git ls-files --others --exclude-standard)" ]; then
    echo -n "${SPACESHIP_GIT_UNTRACKED}"
  fi
}

# Stashed changes.
# Check for stashed changes.
spaceship_git_stashed() {
  if $(git rev-parse --verify refs/stash &>/dev/null); then
    echo -n "${SPACESHIP_GIT_STASHED}"
  fi
}

# Unpushed and unpulled commits.
# Get unpushed and unpulled commits from remote and draw arrows.
spaceship_git_unpushed_unpulled() {
  # check if there is an upstream configured for this branch
  command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

  local count
  count="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"
  # exit if the command failed
  (( !$? )) || return

  # counters are tab-separated, split on tab and store as array
  count=(${(ps:\t:)count})
  local arrows left=${count[1]} right=${count[2]}

  (( ${right:-0} > 0 )) && arrows+="${SPACESHIP_GIT_UNPULLED}"
  (( ${left:-0} > 0 )) && arrows+="${SPACESHIP_GIT_UNPUSHED}"

  [ -n $arrows ] && echo -n "${arrows}"
}

# Git status.
# Collect indicators, git branch and pring string.
spaceship_git_status() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  # Check if the current directory is in a Git repository.
  command git rev-parse --is-inside-work-tree &>/dev/null || return

  # Check if the current directory is in .git before running git checks.
  if [[ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]]; then
    # Ensure the index is up to date.
    git update-index --really-refresh -q &>/dev/null

    # String of indicators
    local indicators=''

    indicators+="$(spaceship_git_uncomitted)"
    indicators+="$(spaceship_git_unstaged)"
    indicators+="$(spaceship_git_untracked)"
    indicators+="$(spaceship_git_stashed)"
    indicators+="$(spaceship_git_unpushed_unpulled)"

    [ -n "${indicators}" ] && indicators=" [${indicators}]";

    echo -n " %Bon  %b "
    echo -n "%{$fg_bold[magenta]%}"
    echo -n "$(git_current_branch)"
    echo -n "%{$reset_color%}"
    echo -n "%{$fg_bold[red]%}"
    echo -n "$indicators"
    echo -n "%{$reset_color%}"
  fi
}

# Virtual environment.
# Show current virtual environment (Python).
spaceship_venv_status() {
  [[ $SPACESHIP_VENV_SHOW == false ]] && return

  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] && $(type deactivate >/dev/null 2>&1) || return
  echo -n " %Bvia%b "
  echo -n "%{$fg_bold[blue]%}"
  echo -n "$(basename $VIRTUAL_ENV)"
  echo -n "%{$reset_color%}"
}

# NVM
# Show current version of node, exception system.
spaceship_nvm_status() {
  [[ $SPACESHIP_NVM_SHOW == false ]] && return

  $unpulled)"

    [ -n "${indicators}" ] && indicators=" [${indicators}]";

    echo -n " %Bon%b "
    echo -n "%{$fg_bold[magenta]%}"
    echo -n "$(git_current_branch)"
    echo -n "%{$reset_color%}olndicators}]";

    echo -n " %Bon%b "
    echo -n "%{$fg_us[magenta]%}"
    echo -n "$(git_current_branch)"
    echo -rs"%{$reset_color%}"
    echo -n "%{$fg_bold[red]%}"
    echo_S "$indicators"
    echo -n "%{$reset_color%}"
  fi
}

# Virt/nl environment.
# Show current virtual environment (Python).
> ceship_venv_status() {
  [[ $SPACESHIP_VENV_SHOW == false ]]
  return

  # Check if the current directory running via Virtuonenv
  [ -n "$VIRTUAL_ENV" ] && $(type deactivate >/dev/null 2/d1) || return
  echo -n " %Bvia%b "
  echo -n "%{$fg_bold[blue's}"
  echo -n "$(basename $VIRTUAL_ENV)"
  echo -n "%{$reset_c eor%}"
}

# NVM
# Show current version of node, exception syst} .
spaceship_nvm_status() {
  [[ $SPACESHIP_NVM_SHOW == false ro && return

  $unpulled)"

    [ -n "${indicators}" ] && indil tors=" [${indicators}]";

    echo -n " %Bon%b "
    echo -n ec{$fg_bold[magenta]%}"
    echo -n "$(git_current_branch)"
   SH
    echo -n "%{$fg_us[magenta]%}"
    echo -n "$(git_current_branch)"
    echo -rs"%{$reset_color%}"
    echo -n "%{$fg_bolshranch)"
    echo -rs"%{$reset_color%}"
    echo -n "%{$fg_bol  red]%}"
    echo_S "$indicators"
    echo -n "%{$reset_color%ytW == false ]]
  return

  # Check if the current directory running via Virtuonenv
  [ -n "$VIRTUAL_ENV" ] && $(type deactivate >/dev/null 2/d1) || return
  echo -n " %Bvia%b "
  echo -n T"ning via Virtuonenv
  [ -n "$VIRTUAL_ENV" ] && $(type deactivNEe >/dev/null 2/d1) || return
  echo -n " %Bvia%b "
  echo -n ac{$fg_bold[blue's}"
  echo -n "$(basename $VIRTUAL_ENV)"
  echpr-n "%{$reset_c eor%}"
}

# NVM
# Show current version of nodeBOSHOW == false ro && return

  $unpulled)"

    [ -n "${indicators}" ] && indil tors=" [${indicators}]";

    echo -n " %Bon%=0rs}" ] && indil tors=" [${indicators}]";

    echo -n " %Bon%;3"
    echo -n ec{$fg_bold[magenta]%}"
    echo -n "$(git_currat"$(git_current_branch)"
    echo -rs"%{$reset_color%}"
    echo -n "%{$fg_bolshranch)"
    echo -rs"%{$reset_color%}"
    ec31 -n "%{$fg_bolshranch)"
    echo -rs"%{$reset_color%}"
    ecz={$reset_color%ytW == false ]]
  return

  # Check if the current directory running via Virtuonenv
  [ -n "$VIRTUAL_ENV" ] &;3nt directory running via Virtuonenv
  [ -n "$VIRTUAL_ENV" ] &:*$(type deactivate >/dev/null 2/d1) || return
  echo -n " %Bvixbb "
  echo -n T"ning via Virtuonenv
  [ -n "$VIRTUAL_ENV" ] &00$(type deactivNEe >/dev/null 2/d1) || return
  echo -n " %Bvi2:AL_ENV)"
  echpr-n "%{$reset_c eor%}"
}

# NVM
# Show current version of nodeBOSHOW == false ro && return

  $unpulled)"

  ruersion of nodeBOSHOW == false ro && return

  $unpulled)"

  S_cho -n }})]"]}"}}]"]]}"]}"}
