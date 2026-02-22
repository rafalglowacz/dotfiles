#!/usr/bin/env zsh
autoload -Uz edit-command-line
zle -N edit-command-line

# Clear the entire multiline buffer without re-rendering the prompt (unlike Ctrl+C).
function clear-whole-buffer() {
  BUFFER=''
  CURSOR=0
}
zle -N clear-whole-buffer
