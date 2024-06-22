#!/usr/bin/env zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}" 

promptParts=(
  $'%{$fg[white]%}'
  $'%{$bg[white]%}%{$fg_bold[black]%}%D{%X} │ %{$reset_color%}'
  $'%{$bg[white]%}%{$fg[black]%}%~%{$reset_color%}'
  $'%{$fg[white]%}%{$reset_color%} '
)
# Add job count. Base form is:  %(1j.%j.)
promptParts+=(
  $'%(1j.%{$fg[yellow]%}%{$bg[yellow]%}%{$fg[black]%}%j%{$reset_color%}%{$fg[yellow]%}%{$reset_color%} .)'
)
promptParts+=(
  $'$(git_prompt_info)'
  $'\n'
  $'%{$fg[blue]%}➜  %{$reset_color%}'
)

IFS=''
PROMPT=$(printf '%s\n' "${promptParts[*]}")
IFS=' '

