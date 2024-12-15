return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    },
    config = function()
        local cmp = require'cmp'
        local luasnip = require'luasnip'

        luasnip.config.setup{
            keep_roots = true,
            link_roots = true,
            link_children = true,
            exit_roots = false,
            update_events = { 'TextChanged', 'TextChangedI' },
            enable_autosnippets = true,
        }

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },

            formatting = {
                format = require('lspkind').cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 25,
                    ellipsis_char = '⋯',
                    before = function(_, vim_item)
                        vim_item.menu = string.gsub(vim_item.menu or '', '%s+', '')
                        local limit = 25
                        if string.len(vim_item.menu) > limit then
                            vim_item.menu = string.sub(vim_item.menu, 0, limit) .. '⋯'
                        end
                        return vim_item
                    end
                }),
            },

            window = {
                completion = cmp.config.window.bordered({border = 'solid'}),
                documentation = cmp.config.window.bordered({border = 'solid'}),
            },

            mapping = cmp.mapping.preset.insert {
                ['<C-t>'] = cmp.mapping.confirm { select = true },
                -- ['<C-Space>'] = cmp.mapping.complete {},
                ['<C-n>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-p>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
                ['<C-k>'] = cmp.mapping(function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            },
        }

        for _, path in ipairs(vim.api.nvim_get_runtime_file('lua/user/snippets/*.lua', true)) do
            loadfile(path)()
        end
    end,
}
