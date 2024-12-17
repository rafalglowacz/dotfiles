-- Used in a few places to get better icons.
vim.g.have_nerd_font = true
-- Prevents race conditions between the default file browser and plugins that replace it.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.colorcolumn = '80,120'
vim.opt.confirm = true
-- Show which line the cursor is on.
vim.opt.cursorline = true
vim.opt.guicursor:append 'a:blinkon100'
-- Preview substitutions live.
vim.opt.inccommand = 'split'
vim.opt.incsearch = false
-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = 'a'
vim.opt.signcolumn='yes:1'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wrap = false
vim.opt.wildmode = 'longest:full,full'

-- Highlight on copy
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on copy',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
    desc = 'Return cursor to where it was last time closing the file',
    group = vim.api.nvim_create_augroup('restore-cursor-position', { clear = true }),
    pattern = '*',
    command = 'silent! normal! g`"zv',
})
