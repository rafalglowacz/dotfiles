return {
    'debugloop/telescope-undo.nvim',
    keys = { { '<leader>u', '<Cmd>Telescope undo<CR>', desc = '[U]ndo history' } },
    opts = {
        extensions = {
            undo = {
                vim_diff_opts = { ctxlen = 3 },
                side_by_side = true,
            },
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('undo')
    end,
}
