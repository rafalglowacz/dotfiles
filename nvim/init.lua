-- Aside from Neovim, I also use IdeaVim plugin for JetBrains IDEs, which uses
-- Vimscript as its configuration language. So I keep common things in the
-- Vimscript format.
vim.cmd('source ~/.config/vim/vimrc')
-- Disable true color. This results in color theme matching the terminal.
vim.cmd('set notermguicolors')

require 'user.options'
require 'user.keymap'
require 'user.lazy'
