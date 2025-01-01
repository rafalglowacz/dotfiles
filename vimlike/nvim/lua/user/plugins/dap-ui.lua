return {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
        local dap_ui = require('dapui')
        dap_ui.setup()
        vim.keymap.set('n', '<leader>dU', dap_ui.toggle, { desc = 'Debugger [U]I' })
    end
}
