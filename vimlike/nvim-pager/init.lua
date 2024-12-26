vim.cmd('source ~/.config/vim/vimrc')
-- Disable true color. This results in colors inside the editor matching
-- the colors of the piped output.
vim.cmd('set notermguicolors')
require 'user.lazy'
