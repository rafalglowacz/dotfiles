vim.keymap.set({ 'n', 'v' }, 'h', 'i')

vim.keymap.set({ 'n', 'v' }, 'i', 'gk')
vim.keymap.set({ 'n', 'v' }, 'j', 'h')
vim.keymap.set({ 'n', 'v' }, 'k', 'gj')
vim.keymap.set({ 'n', 'v' }, 'l', 'l')

-- Add bindings for moving around and showing position in file on every step.
vim.keymap.set('n', '<C-A-i>', 'gkg<C-G>')
vim.keymap.set('n', '<C-A-j>', 'hg<C-G>')
vim.keymap.set('n', '<C-A-k>', 'gjg<C-G>')
vim.keymap.set('n', '<C-A-l>', 'lg<C-G>')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use j to move left"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move right"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use i to move up"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use k to move down"<CR>')

