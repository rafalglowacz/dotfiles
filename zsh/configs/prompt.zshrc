#!/usr/bin/env zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Color definitions for prompt
local dark_gray=$'\e[0;90m'
local white_on_gray=$'\e[37;100m'
local bold=$'\e[1m'
local reset=$'\e[0m'
local bg_red="%{$bg[red]%}"
local fg_black="%{$fg[black]%}"
local bg_white="%{$bg[white]%}"
local fg_yellow="%{$fg[yellow]%}"
local bg_yellow="%{$bg[yellow]%}"
local fg_green="%{$fg[green]%}"
local fg_blue="%{$fg[blue]%}"
local color_reset="%{$reset_color%}"

promptParts=(
  "${dark_gray}"
  "${white_on_gray}${bold}%D{%X} │${reset}"
)

# Show hostname unless current host is a known main host or is marked as one.
if [[ $(hostname) != 'rafal-home' && "$MAIN_HOST" != 1 ]]; then
  promptParts+=(
    "$bg_red$fg_black $(hostname) $bg_white|$color_reset"
  )
fi

promptParts+=(
  "${white_on_gray} %~%{$reset_color%}"
  "${dark_gray}${reset} "
)
# Add job count. Base form is:  %(1j.%j.)
promptParts+=(
  "%(1j.$fg_yellow$bg_yellow$fg_black%j$color_reset$fg_yellow$color_reset .)"
)
if [ -z "$PROMPT_PADDING" ]; then
  PROMPT_PADDING=' '
fi
promptParts+=(
  $'$(git_prompt_info)'
  $'\n'
  " $fg_green❯$fg_yellow❯$fg_blue❯\$PROMPT_PADDING$color_reset"
)

IFS=''
PROMPT=$(printf '%s\n' "${promptParts[*]}")
IFS=' '
