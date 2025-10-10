#!/usr/bin/env zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Color definitions for prompt
local dark_gray=$'\e[0;90m'
local white_on_gray=$'\e[37;100m'
local bold=$'\e[1m'
local reset=$'\e[0m'

promptParts=(
  "${dark_gray}🭔"
  "${white_on_gray}${bold}%D{%X} │${reset}"
)

# Show hostname unless current host is a known main host or is marked as one.
if [[ $(hostname) != 'rafal-home' && "$MAIN_HOST" != 1 ]]; then
  promptParts+=(
    $'%{$bg[red]%}%{$fg[black]%} '$(hostname)' %{$bg[white]%}|%{$reset_color%}'
  )
fi

promptParts+=(
  "${white_on_gray} %~%{$reset_color%}"
  "${dark_gray}🭎${reset} "
)
# Add job count. Base form is:  %(1j.%j.)
promptParts+=(
  $'%(1j.%{$fg[yellow]%}🭔%{$bg[yellow]%}%{$fg[black]%}%j%{$reset_color%}%{$fg[yellow]%}🭎%{$reset_color%} .)'
)
if [ -z "$PROMPT_PADDING" ]; then
  PROMPT_PADDING=' '
fi
promptParts+=(
  $'$(git_prompt_info)'
  $'\n'
  $' %{$fg[green]%}❯%{$fg[yellow]%}❯%{$fg[blue]%}❯$PROMPT_PADDING%{$reset_color%}'
)

IFS=''
PROMPT=$(printf '%s\n' "${promptParts[*]}")
IFS=' '
