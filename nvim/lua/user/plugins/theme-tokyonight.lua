return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- Try also 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
        vim.cmd.colorscheme 'tokyonight-night'

        -- Highlights can be configured by doing something like
        vim.cmd.hi 'Comment gui=none'
    end,
}