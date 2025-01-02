-- Temporary workaround for :Inspect bug: https://github.com/neovim/neovim/issues/31675
-- FIXME: remove after patched in Neovim
vim.hl = vim.highlight

-- Aside from Neovim, I also use IdeaVim plugin for JetBrains IDEs, which uses
-- Vimscript as its configuration language. So I keep common things in the
-- Vimscript format.
vim.cmd('source ~/.config/vim/vimrc')

require 'user.options'
require 'user.keymap'
require 'user.lazy'
