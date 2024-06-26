bindkey '^U' backward-kill-line
# By default Ctrl+P/N cycles through previous commands, even if some text 
# is already typed in. This makes it act like the up/down arrows, which take
# the typed-in text into consideration.
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Alt+Backspace
backward-kill-dir () {
    zle vi-backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Ctrl+Backspace
forward-kill-dir () {
    zle kill-word
    zle -f kill
}
zle -N forward-kill-dir
bindkey '^\b' forward-kill-dir

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
