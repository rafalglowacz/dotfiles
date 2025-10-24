[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:10:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | $COPY_CMD)+abort'"
export FZF_DEFAULT_OPTS="--color=bw --prompt '  ' --pointer '➜'"
export FZF_ALT_C_COMMAND="fd --min-depth 1 --max-depth 3"
export FZF_ALT_C_OPTS="--preview 'eza --icons --group-directories-first -a --hyperlink -lh --time-style relative --color always {}'"

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | head -n 500 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} ${FZF_DEFAULT_OPTS-} -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m" fzf) )
  local ret="$?"
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt

  # Using `head` results in SIGPIPE
  if [ $ret -eq 141 ]; then
    return 0
  else 
    return $ret
  fi
}

zle     -N            fzf-history-widget
bindkey -M emacs '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

fzf-git-branch() {
    local branch
    branch=$(git branch --format='%(refname:short)' | fzf --height=40% --reverse --border)
    if [ -n "$branch" ]; then
        LBUFFER="${LBUFFER}${branch}"
        zle redisplay
    fi
}
zle -N fzf-git-branch
bindkey '^[-' fzf-git-branch
