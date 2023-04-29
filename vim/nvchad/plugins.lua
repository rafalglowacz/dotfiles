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
        hide_root_folder = false,
      },
      update_focused_file = {
        enable = false,
      }
    },
  },
  -- {
  --   "rmagatti/auto-session",
  -- },
}

return plugins
