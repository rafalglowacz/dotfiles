-- Install package manager if not installed
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
  local lazy_repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazy_repo, lazy_path }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazy_path)

-- Configure
require('lazy').setup('user.plugins', {
   ui = {
     icons = vim.g.have_nerd_font and {} or {
       cmd = '⌘',
       config = '🛠',
       event = '📅',
       ft = '📂',
       init = '⚙',
       keys = '🗝',
       plugin = '🔌',
       runtime = '💻',
       require = '🌙',
       source = '📄',
       start = '🚀',
       task = '📌',
       lazy = '💤 ',
     },
   },
 })