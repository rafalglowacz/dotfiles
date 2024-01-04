bindkey \^U backward-kill-line

# Alt+Backspace
backward-kill-dir () {
    zle vi-backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Alt+Left
backward-word-dir () {
    zle vi-backward-word
}
zle -N backward-word-dir
bindkey "^[[1;3D" backward-word-dir

# Alt+Right
forward-word-dir () {
    zle vi-forward-word
}
zle -N forward-word-dir
bindkey "^[[1;3C" forward-word-dir
