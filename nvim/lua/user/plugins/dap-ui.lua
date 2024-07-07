return {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
        local dapUi = require('dapui')
        dapUi.setup()
        vim.keymap.set('n', '<leader>dU', dapUi.toggle, { desc = 'Debugger [U]I' })
    end
}
