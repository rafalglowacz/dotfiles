return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require'dap'
        local scroll_after = require('user.utils').scroll_after

        local path_mappings = nil
        if vim.loop.fs_stat(vim.fn.getcwd()..'/.nvim/path-mappings.lua') then
            path_mappings = dofile(vim.fn.getcwd()..'/.nvim/path-mappings.lua')
        end

        vim.fn.sign_define('DapBreakpoint', { text = '⦁', texthl = 'MiniIconsRed', linehl = '', numhl = '' })
        -- Remove the arrow sign for currently debugged line. I'm using a more
        -- noticable color of current line so I prefer to leave space
        -- in the column available for other signs.
        vim.fn.sign_define('DapStopped', { text = '' })

        -- PHP
        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = { vim.fn.expand'$HOME/dev/lib/vscode-php-debug/out/phpDebug.js' },
        }
        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = '9003',
                pathMappings = path_mappings or {
                    ['/var/www/laravel'] = '${workspaceFolder}',
                },
            },
        }

        -- Rust
        dap.adapters.lldb = {
            type = 'executable',
            command = '/usr/bin/lldb-vscode',
            name = 'lldb',
        }
        dap.configurations.rust = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }

        -- Key bindings

        -- This is incomplete. "td" is only consistent with IdeaVim for starting
        -- Rust tests and it can't debug tests for other languages yet.
        for _, key in ipairs({ '<leader>dc', '<leader>td', '--' }) do
            vim.keymap.set(
                'n',
                key,
                function()
                    if vim.bo.filetype == 'rust' and dap.session() == nil then
                        vim.cmd.RustLsp('debug')
                    else
                        dap.continue()
                        require('dapui').open()
                        vim.cmd('NvimTreeClose')
                    end
                end,
                { desc = 'Continue' }
            )
        end

        for _, key in ipairs({ '<F9>', '-o', '<leader>do' }) do
            vim.keymap.set('n', key, dap.step_over, { desc = 'Step [o]ver' })
        end
        for _, key in ipairs({ '<F8>', '-i', '<leader>di' }) do
            vim.keymap.set('n', key, scroll_after(dap.step_into), { desc = 'Step [i]nto' })
        end
        for _, key in ipairs({ '<F7>', '-u', '<leader>du' }) do
            vim.keymap.set('n', key, scroll_after(dap.step_out), { desc = 'Step o[u]t' })
        end
        for _, key in ipairs({ '<F5>', '-r', '<leader>dr' }) do
            vim.keymap.set('n', key, scroll_after(dap.run_to_cursor), { desc = 'Run to cursor' })
        end
        vim.keymap.set(
            'n',
            '<leader>db',
            function() dap.toggle_breakpoint() end,
            { desc = 'Toggle [b]reakpoint' }
        )
        vim.keymap.set(
            'n',
            '<leader>dB',
            function() dap.set_breakpoint(vim.fn.input('Condition: ')) end,
            { desc = 'Set conditional breakpoint' }
        )
        -- vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set('n', '<leader>dd', dap.run_last, { desc = 'Run [l]ast' })
        vim.keymap.set({ 'n', 'v' }, '<leader>dh', require('dap.ui.widgets').hover, { desc = '[H]over' })
        vim.keymap.set({ 'n', 'v' }, '<leader>dp', require('dap.ui.widgets').preview, { desc = '[P]review' })
        vim.keymap.set(
            'n',
            '<leader>df',
            function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end,
            { desc = '[F]rames' }
        )
        vim.keymap.set('n', '<leader>rs', dap.terminate, { desc = '[S]top' })
        -- vim.keymap.set(
        --   'n',
        --   '<leader>ds',
        --   function()
        --     local widgets = require('dap.ui.widgets')
        --     widgets.centered_float(widgets.scopes)
        --   end,
        --   { desc = 'Scopes' }
        -- )
    end,
}
