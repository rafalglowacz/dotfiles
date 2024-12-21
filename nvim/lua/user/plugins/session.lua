return {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
        local opts = {
            post_restore_cmds = {
                function()
                    require('nvim-tree.api').tree.toggle()
                    vim.api.nvim_input('<C-w><C-w>')
                end
            }
        }
        require('auto-session').setup(opts)
    end
}
