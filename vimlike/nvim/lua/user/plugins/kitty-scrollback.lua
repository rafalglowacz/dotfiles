return {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
    event = { 'User KittyScrollbackLaunch' },
    config = function()
        require('kitty-scrollback').setup()
        if vim.env.KITTY_SCROLLBACK_NVIM == 'true' then
            vim.opt.signcolumn='no'
        end
    end,
}
