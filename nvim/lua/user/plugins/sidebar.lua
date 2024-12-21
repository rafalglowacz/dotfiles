return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        local api = require('nvim-tree.api')

        -- Options + buffer bindings
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
                vim.keymap.set('n', '<right>', function()
                    local node = api.tree.get_node_under_cursor()
                    if node.name == '..' then
                        -- Just move to the first child.
                        vim.api.nvim_input('<down>')
                        return
                    end

                    api.node.open.preview()

                    if node.type == 'directory' and next(node.nodes) ~= nil then
                        -- Move to first item in a non-empty directory.
                        vim.api.nvim_input('<down>')
                    end
                end, opts('Open'))
                vim.keymap.set('n', '<left>', api.node.navigate.parent_close, opts('Close'))
            end
        })

        -- Highlights
        -- For some reason setting theme here works for the dark theme and for
        -- the light theme they have to be set in the ColorScheme listener.
        local hlCallback = function()
            vim.cmd('hi NvimTreeNormal guibg=none')
            vim.cmd('hi NvimTreeNormalNC guibg=none')
        end
        vim.api.nvim_create_autocmd('ColorScheme', {
            group = vim.api.nvim_create_augroup('my-color-scheme', { clear = true }),
            callback = hlCallback
        })
        hlCallback()

        -- Global bindings
        vim.keymap.set('n', '<A-1>', '<Cmd>:NvimTreeFocus<CR>')
        vim.keymap.set('n', '<leader>F', '<Cmd>:NvimTreeFindFile<CR>')

        -- Activate on startup
        if vim.fn.expand('%:t') ~= 'COMMIT_EDITMSG' then
            vim.cmd('NvimTreeFocus')
        end
    end
}
