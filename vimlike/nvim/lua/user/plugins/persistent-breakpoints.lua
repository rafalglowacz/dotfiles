return {
    'Weissle/persistent-breakpoints.nvim',
    lazy = false,
    config = function()
        require('persistent-breakpoints').setup {
            load_breakpoints_event = { 'BufReadPost' },
        }
    end,
    keys = {
        {
            '<leader>db',
            function() require('persistent-breakpoints.api').toggle_breakpoint() end,
            desc = 'Toggle breakpoint',
        },
        {
            '<leader>dB',
            function() require('persistent-breakpoints.api').set_conditional_breakpoint() end,
            desc = 'Set conditional breakpoint',
        },
        {
            '<leader>d,',
            function()
                require('persistent-breakpoints.api').reload_breakpoints()
                -- Reopen DAP UI to update breakpoint list (it won't happen automatically)
                require('dapui').toggle()
                require('dapui').toggle()
            end,
            desc = 'Reload breakpoints',
        },
    },
}
