-- Install package manager if not installed
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
    local lazy_repo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazy_repo, lazy_path }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazy_path)

local spec = vim.env.KITTY_SCROLLBACK_NVIM == 'true' and {} or {
    require('user.plugins.aerial'),
    require('user.plugins.baleia'),
    require('user.plugins.bookmarks'),
    require('user.plugins.chad-tree'),
    require('user.plugins.cmp'),
    require('user.plugins.colorizer'),
    require('user.plugins.comment'),
    require('user.plugins.dap'),
    require('user.plugins.dap-helper'),
    require('user.plugins.dap-ui'),
    require('user.plugins.dap-virtual-text'),
    require('user.plugins.db'),
    require('user.plugins.gitsigns'),
    require('user.plugins.intent-guides'),
    require('user.plugins.laravel'),
    require('user.plugins.leap'),
    require('user.plugins.linting'),
    require('user.plugins.lsp-config'),
    require('user.plugins.lspkind'),
    require('user.plugins.lualine'),
    require('user.plugins.mini'),
    require('user.plugins.mulpiple-cursors-brenton'),
    require('user.plugins.multiple-cursors-smoka7'),
    require('user.plugins.neotest'),
    require('user.plugins.notify'),
    require('user.plugins.pasta'),
    -- require('user.plugins.persistent-breakpoints'),
    require('user.plugins.rustaceanvim'),
    require('user.plugins.session'),
    require('user.plugins.sidebar'),
    require('user.plugins.sleuth'),
    require('user.plugins.telescope-undo'),
    require('user.plugins.telescope'),
    require('user.plugins.test'),
    require('user.plugins.theme-tokyonight'),
    require('user.plugins.tidy'),
    require('user.plugins.todo-comments'),
    require('user.plugins.treesitter'),
    require('user.plugins.treesj'),
    require('user.plugins.whichkey'),
}
table.insert(spec, require('user.plugins.kitty-scrollback'))

-- Configure
require('lazy').setup({
    -- I'm explicitly specifying the plugins instead of sending 'user.plugins'
    -- as the first argument to setup(). This way I can bisect issues easily.
    spec = spec,
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
