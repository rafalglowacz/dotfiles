return {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
        local opts = {
            post_restore_cmds = {
                function()
                    if vim.env.KITTY_SCROLLBACK_NVIM ~= 'true' then
                        require('nvim-tree.api').tree.toggle()
                        vim.api.nvim_input('<C-w><C-w>')
                    end
                end
            }
        }
        require('auto-session').setup(opts)
    end
}
