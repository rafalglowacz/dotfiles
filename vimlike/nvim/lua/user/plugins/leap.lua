return {
    'ggandor/leap.nvim',
    lazy = false,
    config = function ()
        vim.keymap.set({'n', 'x', 'o'}, '<A-n>', '<Plug>(leap)')
    end
}
