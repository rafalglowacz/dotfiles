ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}" 

promptParts=(
  $'%{$fg[white]%}%'
  $'{$bg[white]%}%{$fg_bold[black]%}%D{%X} │ %{$reset_color%}'
  $'%{$bg[white]%}%{$fg[black]%}%~%{$reset_color%}'
  $'%{$fg[white]%}%{$reset_color%} '
  $'$(git_prompt_info)'
  $'\n'
  $'%{$fg[blue]%}➜ '
)

IFS=''
PROMPT=$(printf '%s\n' "${promptParts[*]}")
IFS=' '
