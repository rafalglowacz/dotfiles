return {
    enabled = false,

    'nvim-neotest/neotest',
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        print('Neotest here')
        local neotest = require('neotest')
        neotest.setup({
            adapters = {
                require('rustaceanvim.neotest'),
            }
        })

        vim.keymap.set(
            'n',
            '<leader>td',
            function() neotest.run.run({ strategy = 'dap' }) end,
            { desc = 'Debug test' }
        )
        vim.keymap.set(
            'n',
            '<leader>tf',
            function() neotest.run.run(vim.fn.expand("%")) end,
            { desc = 'Run file' }
        )
        vim.keymap.set('n', '<leader>tn', neotest.run.run, { desc = 'Run nearest' })
    end,
}
