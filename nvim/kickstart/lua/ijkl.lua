vim.keymap.set({ 'n', 'v' }, 'h', 'i')

vim.keymap.set({ 'n', 'v' }, 'i', 'gk')
vim.keymap.set({ 'n', 'v' }, 'j', 'h')
vim.keymap.set({ 'n', 'v' }, 'k', 'gj')
vim.keymap.set({ 'n', 'v' }, 'l', 'l')

-- Alternative to Home/End
vim.keymap.set({ 'n', 'v' }, 'gj', '0');
vim.keymap.set({ 'n', 'v' }, 'gl', '$');

vim.keymap.set({ 'n', 'v' }, 'H', 'I')
vim.keymap.set({ 'n', 'v' }, 'I', 'H')

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

vim.keymap.set('n', 'yh', 'yi')
vim.keymap.set('n', 'ch', 'ci')
vim.keymap.set('n', 'dh', 'di')

vim.keymap.set('n', 'yi', '<Nop>')
vim.keymap.set('n', 'ci', '<Nop>')
vim.keymap.set('n', 'di', '<Nop>')
