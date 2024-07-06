return { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    },
    keys = {
        { '<leader>gS', function() require'gitsigns'.undo_stage_hunk() end,
          desc = 'Git: un[s]tage hunk' },

        { '<leader>gs', function() require'gitsigns'.stage_hunk() end,
          desc = 'Git: [s]tage hunk' },

        { '<leader>gP', function() require'gitsigns'.preview_hunk() end,
          desc = 'Git: [p]review hunk' },

        { '<leader>gh', function() require'gitsigns'.reset_hunk() end,
          desc = 'Git: reset [h]unk' },

        { '<leader>gb', function() require'gitsigns'.blame_line() end,
          desc = 'Git: [b]lame line' },

        { ']g',        function() require'gitsigns'.next_hunk() end, desc = 'Git: next hunk' },
        { '<leader>n', function() require'gitsigns'.next_hunk() end, desc = 'Git: next hunk' },
        { '[g',        function() require'gitsigns'.prev_hunk() end, desc = 'Git: previous hunk' },
        { '<leader>p', function() require'gitsigns'.prev_hunk() end, desc = 'Git: previous hunk' },
    },
}