return {
  {
    'projekt0n/github-nvim-theme', 
    version = 'v0.0.7',
    config = function()
      require('github-theme').setup()
    end
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = function(_, opts)
      opts.window.position = 'right'
      opts.window.width = 50
    end
  },
  {
    'rcarriga/nvim-notify',
    enabled = false,
  },
}
