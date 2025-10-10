bindkey '^U' backward-kill-line
# By default Ctrl+P/N cycles through previous commands, even if some text 
# is already typed in. This makes it act like the up/down arrows, which take
# the typed-in text into consideration.
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^[[B' atuin-up-search
bindkey '^[OB' atuin-up-search
# Alt+E / Option+E - Edit command line in external editor
bindkey '^[e' edit-command-line
# Alt+Left/Right
bindkey "^[[1;3D" vi-backward-word
bindkey "^[[1;3C" vi-forward-word

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

