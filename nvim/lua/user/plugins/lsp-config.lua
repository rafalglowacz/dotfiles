local ok, local_opts = pcall(require, 'local.opts')
if not ok then local_opts = {} end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('-rn', vim.lsp.buf.rename, 'Re[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('K', vim.lsp.buf.hover, 'Hover Documentation')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local servers = {
            rust_analyzer = {},
            tsserver = {
                cmd = local_opts['tsserver.cmd'], -- If nil, default cmd will be used.
                init_options = {
                    tsserver = {
                        path = vim.fn.expand '$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib',
                    },
                    plugins = {
                        {
                            name = '@vue/typescript-plugin',
                            location = vim.fn.expand '$HOME/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin',
                            languages = { 'vue' },
                        },
                    },
                },
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            },
            --
            volar = {
                cmd = local_opts['volar.cmd'],
                -- init_options = {
                --   typescript = {
                --     -- TODO: check if actually needed. The problem with Vue 2
                --     -- in work project was solved by setting tsserver.path
                --     -- in the TS language server's config.
                --     tsdk = vim.fn.expand '$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib',
                --   }
                -- },
            },
            phpactor = {},
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                '${3rd}/luv/library',
                                unpack(vim.api.nvim_get_runtime_file('', true)),
                            },
                        },
                        completion = {
                            callSnippet = 'Replace',
                        },
                         diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            },
        }

        require('mason').setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        local mason_lsp = require('mason-lspconfig')

        mason_lsp.setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
                ['rust_analyzer'] = function() end
            },
        }

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = 'solid'
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end
    end,
}