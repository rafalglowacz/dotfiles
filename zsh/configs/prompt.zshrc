#!/usr/bin/env zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

promptParts=(
  $'\e[0;90m'
  $'\e[37;100m\e[1m%D{%X} │\e[0m'
)

# Show hostname unless current host is a known main host or is marked as one.
if [[ $(hostname) != 'rafal-home' && "$MAIN_HOST" != 1 ]]; then
  promptParts+=(
    $'%{$bg[red]%}%{$fg[black]%} '$(hostname)' %{$bg[white]%}|%{$reset_color%}'
  )
fi

promptParts+=(
  $'\e[37;100m %~%{$reset_color%}'
  $'\e[0;90m\e[0m '
)
# Add job count. Base form is:  %(1j.%j.)
promptParts+=(
  $'%(1j.%{$fg[yellow]%}%{$bg[yellow]%}%{$fg[black]%}%j%{$reset_color%}%{$fg[yellow]%}%{$reset_color%} .)'
)
if [ -z "$PROMPT_PADDING" ]; then
  PROMPT_PADDING=' '
fi
promptParts+=(
  $'$(git_prompt_info)'
  $'\n'
  $'%{$fg[blue]%} ➤$PROMPT_PADDING%{$reset_color%}'
)

IFS=''
PROMPT=$(printf '%s\n' "${promptParts[*]}")
IFS=' '
