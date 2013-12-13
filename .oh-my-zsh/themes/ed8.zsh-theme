# ZSH Theme - Preview: http://dl.dropbox.com/u/1552408/Screenshots/2010-04-08-oh-my-zsh.png

local default_username='ed8'
local default_host='laptop'

# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
CYAN=$fg[cyan]
MAGENTA=$fg[magenta]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
CYAN_BOLD=$fg_bold[cyan]
MAGENTA_BOLD=$fg_bold[magenta]
RESET_COLOR=$reset_color


# @description Hour of prompt invocation
# @return    string
hour() {
  hour="$(date '+%H')"
  color="%{$WHITE%}"
  (($hour >= 17 || $hour <= 19 )) && color="%{$YELLOW%}"
  (($hour >= 23 || $hour <= 4 )) && color="%{$RED%}"

  echo "${color}$hour%{$RESET_COLOR%}"
}

# @description minute of prompt invocation
# @return    string
min() {
  min="$(date '+%M')"
  color="%{$WHITE%}"
  (($min > 30)) && color="%{$YELLOW%}"
  (($min > 45)) && color="%{$RED%}"
  echo "${color}$min%{$RESET_COLOR%}"
}


# @description Highlight root user
# @return    string
user_level() {
  if [ $UID -eq 0 ]
  then
    level_color="%{$RED%}"
  else
    level_color="%{$GREEN%}"
  fi
  echo $level_color
}


# @description Only show username if not default
# @return    string
username() {
  if [[ $USER != $default_username ]]
  then
    echo '%n@'
  fi
}


# @description Only show username if not default
# @return    string
hostname() {
  if [[ $HOST != $default_host || -n "$SSH_CLIENT" ]]
  then
    echo '@%m '
  fi
}

# @description path to display
# @return    string
cpwd() {
  pwd="$(pwd)"
  cpwd="$(dirname "$pwd")"
  cwd="$(basename "$pwd")"
  echo "%{$RESET_COLOR%}$cwd %{$WHITE%}$pwd/"
}


# Set prompt char
prompt_char() {
  if [ $UID -eq 0 ]
  then
    color="%{$GREEN_BOLD%}"
  else
    color="%{$BLUE%}"
  fi
  echo $color'›' # ❱
}

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}±%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$RESET_COLOR%} "
# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="⚡"
# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}⤨%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}×%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}→%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}∗%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}+%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}⛀%{$RESET_COLOR%}"
# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$BLUE%}↣%{$RESET_COLOR%}"

PROMPT='
$(user_level)$(username)$(hostname)$(cpwd)
$(parse_git_dirty)$(git_prompt_ahead)$(prompt_char) '
PROMPT2='%{$fg[red]%}\ %{$RESET_COLOR%}'
RPROMPT='$(git_prompt_status)  %{$GREEN%}$(current_branch)%{$WHITE%} | $(hour)%{$WHITE%}:$(min)%{$RESET_COLOR%}'
