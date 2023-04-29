require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  view = {
    side = "right",
    width = 50,
    hide_root_folder = false,
  }
})

vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')
