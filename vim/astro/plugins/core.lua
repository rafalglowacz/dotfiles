return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = function(_, opts)
      opts.window.position = 'right'
      opts.window.width = 50
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup({
        pickers = {
          find_files = {
            mappings = {
              n = {
                ['cd'] = function(prompt_bufnr)
                  local actions = require('telescope.actions');
                  local state = require('telescope.actions.state');
                  local selection = state.get_selected_entry()
                  actions.close(prompt_bufnr);
                  vim.cmd('Neotree reveal_file=' .. selection.path)
                end
              }
            }
          }
        }
      })
    end
  },
  {
    'princejoogie/dir-telescope.nvim',
    config = function()
      require('dir-telescope').setup()
    end
  },
  {
    'projekt0n/github-nvim-theme', 
    version = 'v0.0.7',
    config = function()
      require('github-theme').setup()
    end
  },
  -- Themes
  { 
    'catppuccin/nvim', 
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({ flavour = 'latte' })
    end
  },
  -- Disabled plugins
  {
    'rcarriga/nvim-notify',
    enabled = false,
  },
}
