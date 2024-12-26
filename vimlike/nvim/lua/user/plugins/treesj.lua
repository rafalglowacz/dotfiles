return {
    'Wansmer/treesj',
    keys = {
        { 'gJ', function() require('treesj').join() end, desc = 'Join lines' },
        { 'gS', function() require('treesj').split() end, desc = 'Split into lines' },
    },
    opts = { use_default_keymaps = false },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
}