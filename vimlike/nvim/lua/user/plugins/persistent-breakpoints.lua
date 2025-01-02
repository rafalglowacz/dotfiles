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
    },
}
