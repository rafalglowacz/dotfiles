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
                local function opts(desc)
                    return {
                        desc = "nvim-tree: " .. desc, buffer = bufNr, noremap = true, silent = true, nowait = true
                    }
                end

                api.config.mappings.default_on_attach(bufNr)
                vim.keymap.set('n', '<right>', api.node.open.preview, opts('Open'))
                vim.keymap.set('n', '<left>', api.node.navigate.parent_close, opts('Close'))
            end
        })
        vim.keymap.set('n', '<A-0>', '<Cmd>:NvimTreeFocus<CR>')
        vim.keymap.set('n', '<leader>F', '<Cmd>:NvimTreeFindFile<CR>')
        if vim.fn.expand('%:t') ~= 'COMMIT_EDITMSG' then
            vim.cmd('NvimTreeFocus')
        end
    end
}
