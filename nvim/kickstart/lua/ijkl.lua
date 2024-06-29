vim.keymap.set({ 'n', 'v' }, 'h', 'i')

vim.keymap.set({ 'n', 'v' }, 'i', 'gk')
vim.keymap.set({ 'n', 'v' }, 'j', 'h')
vim.keymap.set({ 'n', 'v' }, 'k', 'gj')
vim.keymap.set({ 'n', 'v' }, 'l', 'l')

-- Alternative to Home/End
vim.keymap.set({ 'n', 'v' }, 'gj', 'gh', { remap = true });

vim.keymap.set({ 'n', 'v' }, 'H', 'I')
vim.keymap.set({ 'n', 'v' }, 'I', 'H')

-- Add bindings for moving around and showing position in file on every step.
vim.keymap.set('n', '<C-A-i>', 'gkg<C-G>')
vim.keymap.set('n', '<C-A-j>', 'hg<C-G>')
vim.keymap.set('n', '<C-A-k>', 'gjg<C-G>')
vim.keymap.set('n', '<C-A-l>', 'lg<C-G>')

vim.keymap.set('n', '<A-i>', '<C-w><C-k>', { desc = 'Move focus up' })
vim.keymap.set('n', '<A-j>', '<C-w><C-h>', { desc = 'Move focus left' })
vim.keymap.set('n', '<A-k>', '<C-w><C-j>', { desc = 'Move focus down' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus right' })

vim.keymap.set('n', 'yh', 'yi')
vim.keymap.set('n', 'ch', 'ci', { remap = true })
vim.keymap.set('n', 'dh', 'di')

vim.keymap.set('n', 'yi', '<Nop>')
vim.keymap.set('n', 'ci', '<Nop>')
vim.keymap.set('n', 'di', '<Nop>')
