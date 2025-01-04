#!/usr/bin/env zsh
autoload -Uz edit-command-line
zle -N edit-command-line

function kitty_scrollback_edit_command_line() {
  local VISUAL="$HOME/.local/share/nvim/lazy/kitty-scrollback.nvim/scripts/edit_command_line.sh"
  zle edit-command-line
  zle kill-whole-line
}
zle -N kitty_scrollback_edit_command_line

bindkey '^x^e' kitty_scrollback_edit_command_line
