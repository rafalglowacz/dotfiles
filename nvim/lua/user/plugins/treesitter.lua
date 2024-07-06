return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
            auto_install = true,
            ignore_install = { 'gitcommit' },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
        }
    end,
}