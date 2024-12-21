-- Aside from Neovim, I also use IdeaVim plugin for JetBrains IDEs, which uses
-- Vimscript as its configuration language. So I keep common things in the
-- Vimscript format.
vim.cmd('source ~/.config/vim/vimrc')

require 'user.options'
require 'user.keymap'
require 'user.lazy'
