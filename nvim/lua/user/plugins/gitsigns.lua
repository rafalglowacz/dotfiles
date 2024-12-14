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
        on_attach = function()
            local gitsigns = require'gitsigns'

            vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git: [s]tage hunk' })
            vim.keymap.set('n', '<leader>gS', gitsigns.undo_stage_hunk, { desc = 'Git: un[s]tage hunk' })
            vim.keymap.set('n', '<leader>gP', gitsigns.preview_hunk, { desc = 'Git: [p]review hunk' })
            vim.keymap.set('n', '<leader>gh', gitsigns.reset_hunk, { desc = 'Git: reset [h]unk' })
            vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = 'Git: [b]lame line' })
            vim.keymap.set('n', '<leader>n', gitsigns.next_hunk, { desc = 'Git: next hunk' })
            vim.keymap.set('n', '<leader>p', gitsigns.prev_hunk, { desc = 'Git: previous hunk' })
        end,
    },
}
