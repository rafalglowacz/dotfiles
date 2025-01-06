return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module 'ibl'
    ---@type ibl.config
    opts = {
        indent = {
            char = '▏',
            highlight = 'EndOfBuffer',
        },
        scope = {
            highlight = 'Whitespace',
        },
    },
}
