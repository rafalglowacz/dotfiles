local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right",
        width = 50,
      }
    }
  }
}

return plugins
