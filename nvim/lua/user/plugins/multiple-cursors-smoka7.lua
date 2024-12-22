return {
    enabled = false,

    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvimtools/hydra.nvim',
    },
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
        {
            mode = { 'v', 'n' },
            '<Leader>m',
            '<cmd>MCunderCursor<cr>',
            desc = 'Start multicursors',
        },
        {
            mode = { 'v', 'n' },
            '<Leader>M',
            '<cmd>MCstart<cr>',
            desc = 'Start multicursors for selection',
        },
    },
    config = function ()
        local N = require('multicursors.normal_mode')
        local E = require('multicursors.extend_mode')

        require('multicursors').setup({
            normal_keys = {
                ['<up>'] = {
                    method = N.create_up,
                    opts = {},
                },
                ['<down>'] = {
                    method = N.create_down,
                    opts = {},
                },
            },
            extend_keys = {
                ['<up>'] = {
                    method = E.k_method,
                    opts = { desc = 'char up' },
                },
                ['<left>'] = {
                    method = E.h_method,
                    opts = { desc = 'char left' },
                },
                ['<down>'] = {
                    method = E.j_method,
                    opts = { desc = 'char down' },
                },
                ['<right>'] = {
                    method = E.l_method,
                    opts = { desc = 'char right' },
                },
            },
        })
    end
}
