# ------------------------------------------------------------------------
# Tomorrow
#
# Based on Juan G. Hurtado oh-my-zsh theme
# (Needs Git plugin for current_branch method)
# ------------------------------------------------------------------------

local default_username='username'
local default_host='host'

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

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RESET_COLOR%} %{$YELLOW%}✷"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$RESET_COLOR%}"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}⤮%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}⨯%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}➜%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}∗%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}➕%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}⛀%{$RESET_COLOR%}"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$BLUE%}↣%{$RESET_COLOR%}"

# Only show username if not default
username() {
	if [[ $USER != $default_username || $HOST != $default_host || -n "$SSH_CLIENT" ]]
	then
		echo '%n@%m:'
	fi
}

# Set prompt char
prompt_char() {
	if [ $UID -eq 0 ]
	then
		color="%{$GREEN_BOLD%}"
	else
		color="%{$BLUE%}"
	fi
	echo $color'❱'
}

# Fishy collapsed working dir
cpwd() {
	echo $(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g")
}

# Prompt format
PROMPT='
%{$GREEN_BOLD%}`username`%{$BLUE_BOLD%}`cpwd`%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
`prompt_char`%{$RESET_COLOR%} '

RPROMPT='$(git_prompt_status)  %{$GREEN_BOLD%}$(current_branch)%{$RESET_COLOR%}'
