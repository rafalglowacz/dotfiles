return {
  'daic0r/dap-helper.nvim',
  dependencies = { "rcarriga/nvim-dap-ui", "mfussenegger/nvim-dap" },
  config = function()
    require("dap-helper").setup()
  end
}
