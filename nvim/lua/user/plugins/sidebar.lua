return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        local api = require('nvim-tree.api')
        require('nvim-tree').setup({
            view = {
                side = 'right',
                width = 35,
            },
            on_attach = function(bufNr)
                api.config.mappings.default_on_attach(bufNr)
                vim.keymap.set('n', '<right>', api.node.open.preview, { buffer = bufNr })
                vim.keymap.set('n', '<left>', api.node.navigate.parent_close, { buffer = bufNr })
            end
        })
        vim.keymap.set('n', '<A-0>', '<Cmd>:NvimTreeFocus<CR>')
        vim.keymap.set('n', '<leader>F', '<Cmd>:NvimTreeFindFile<CR>')
    end
}
