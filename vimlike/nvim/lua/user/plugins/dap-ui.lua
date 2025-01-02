return {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
        local dap_ui = require('dapui')
        local utils = require('user.utils')

        dap_ui.setup({
            -- Specify a custom layout without the bottom elements (repl, console), I use a floating repl.
            layouts = { {
                elements = {
                    { id = "scopes", size = 0.25 },
                    { id = "breakpoints", size = 0.25 },
                    { id = "stacks", size = 0.25 },
                    { id = "watches", size = 0.25 },
                },
                position = "left",
                size = 40
            } }
        })

        vim.keymap.set('n', '<leader>dU', dap_ui.toggle, { desc = 'Debugger [U]I' })

        -- Add a floating repl with currently selected expression if present.
        -- I think dapui.eval should do the same thing, but in reality it can't
        -- evaluate anything for me, at least in PHP.
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>de',
            function ()
                local expr = vim.api.nvim_get_mode().mode == 'v' and utils.eval_expression() or nil
                dap_ui.float_element('repl')
                vim.defer_fn(function()
                    local ins = 'i<BS>' -- Backspace in case we're in the insert mode already.
                    vim.api.nvim_input(expr and ins..expr..'<CR>' or ins)
                end, 250)
            end,
            { desc = 'Open REPL' }
        )
    end
}
