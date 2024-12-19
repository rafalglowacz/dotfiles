return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        local actions = require'telescope.actions'
        local actions_state = require'telescope.actions.state'
        local builtin = require'telescope.builtin'

        require('telescope').setup {
            defaults = {
                layout_strategy = 'vertical',
                path_display = function(_, path)
                    local tail = require("telescope.utils").path_tail(path)

                    -- There's a weird bug on my work Mac where the paths in the go-to-reference picker contain
                    -- the full absolute path because cwd isn't removed. I was able to determine that it has
                    -- something to do with the path containing a dash. I couldn't find a real fix, so I'm
                    -- working around it by using sub instead of gsub if the path is absolute. By using
                    -- the length of cwd's path, it has the intended effect.
                    path = path:sub(1, 1) == '/'
                        and path:sub(string.len(vim.loop.cwd() or '') + 2)
                        or  path:gsub(vim.loop.cwd() .. '/', '')

                    path = path:sub(0, - string.len(tail) - 2)
                    if string.len(path) == 0 then
                        return tail
                    else
                        return string.format("%s (%s)", tail, path)
                    end
                end,
                scroll_strategy = 'limit',
                mappings = {
                    i = {
                        ['<C-Enter>'] = 'to_fuzzy_refine',
                        ['<Esc>'] = actions.close,
                        ['<A-p>'] = actions.cycle_history_prev,
                        ['<A-n>'] = actions.cycle_history_next,
                    }
                },
            },
            pickers = {
                find_files = {
                    find_command = { 'fd', '--type', 'f' },
                    mappings = {
                        i = {
                            ['<C-a>'] = function(prompt_bufnr)
                                local current_picker = actions_state.get_current_picker(prompt_bufnr)
                                local search_term = current_picker:_get_prompt()
                                actions.close(prompt_bufnr)
                                builtin.find_files({
                                    default_text = search_term,
                                    hidden = true,
                                    no_ignore = true,
                                    no_ignore_parent = true,
                                })
                            end
                        }
                    }
                }
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        -- Enable telescope extensions, if they are installed.
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local make_callback = function(callback)
            return function()
                local delay = 0
                -- If sidebar is open, switch to previous buffer,
                -- otherwise selected file will open in the sidebar.
                if vim.fn.expand('%'):find('^chadtree://') then
                    vim.api.nvim_input([[<C-w><C-w>]])
                    delay = 100
                end

                vim.defer_fn(callback, delay)
            end
        end

        local find_files = make_callback(function()
            builtin.find_files()
        end)

        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search [h]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search [k]eymaps' })
        vim.keymap.set(
            'n',
            '<leader>sf',
            find_files,
            { desc = 'Search [f]iles' }
        )
        vim.keymap.set(
            'n',
            '<leader>f',
            find_files,
            { desc = 'Search [f]iles' }
        )
        vim.keymap.set(
            'n',
            '<leader>ss',
            make_callback(builtin.builtin),
            { desc = 'Search [s]elect Telescope' }
        )
        vim.keymap.set(
            'n',
            '<leader>sw',
            make_callback(builtin.grep_string),
            { desc = 'Search current [w]ord' }
        )
        vim.keymap.set(
            'n',
            '<leader>sg',
            make_callback(function()
                builtin.live_grep({ additional_args = { '--engine=pcre2' } })
            end),
            { desc = 'Search by [g]rep' }
        )
        vim.keymap.set(
            'n',
            '<leader>sd',
            make_callback(builtin.diagnostics),
            { desc = 'Search [d]iagnostics' }
        )
        vim.keymap.set(
            'n',
            '<leader>sr',
            make_callback(builtin.resume),
            { desc = 'Search [r]esume' }
        )
        vim.keymap.set(
            'n',
            '<leader>s.',
            make_callback(
                function() builtin.oldfiles({ cwd_only = true }) end
            ),
            { desc = 'Recent files' }
        )
        vim.keymap.set(
            'n',
            '<leader><leader>',
            make_callback(
                function() builtin.buffers{ sort_lastused = true } end
            ),
            { desc = 'List open files' }
        )

        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = 'Search current file' })

        vim.keymap.set('n', '<leader>s/', make_callback(function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
                additional_args = { '--engine=pcre2' },
            })
        end), { desc = 'Search [/] in Open Files' })

        vim.keymap.set('n', '<leader>sn', make_callback(function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end), { desc = 'Search [N]eovim files' })
    end,
}
