vim.keymap.set(
  '!',
  '<Esc>',
  function()
    -- Default behavior:
    vim.cmd.stopinsert()
    -- Save file, but not if it's a Neovim config file, as that results
    -- in Neovim showing notifications about reloading the config all the time.
    if string.find(vim.api.nvim_buf_get_name(0), '/dotfiles/nvim/') == nil then
      vim.api.nvim_input(':w<CR>')
    end
  end
)

-- In visual mode, 'v' will toggle between char-wise and block-wise mode.
vim.keymap.set('v', 'v', function()
  if vim.api.nvim_get_mode()['mode'] == 'v' then
    vim.api.nvim_input('<C-v>')
  else
    vim.cmd('normal! v')
  end
end)

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Show [e]rror' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[Q]uickfix list' })

-- Add convenience bindings for keyword completion,
-- just like Alt-; and Alt-/ in PHPStorm.
vim.keymap.set('i', '<A-;>', function()
  if vim.fn.pumvisible() == 1 then
    -- If the popup menu is visible, cycle through suggestions.
    return '<C-p>'
  else
    -- If the popup menu is not visible, start keyword completion.
    return '<C-x><C-p>'
  end
end, { expr = true })

-- See above
vim.keymap.set('i', '<A-/>', function()
  if vim.fn.pumvisible() == 1 then return '<C-n>' else return '<C-x><C-n>' end
end, { expr = true })
