return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require'dap'

        -- PHP
        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = { vim.fn.expand'$HOME/Dev/lib/vscode-php-debug/out/phpDebug.js' },
        }
        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = '9003',
                pathMappings = {
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
        vim.keymap.set(
            'n',
            '<leader>dc',
            function() dap.continue() end,
            { desc = '[C]ontinue' }
        )
        for _, key in ipairs({ '<F9>', '-o' }) do
            vim.keymap.set('n', key, dap.step_over, { desc = 'Step [o]ver' })
        end
        for _, key in ipairs({ '<F8>', '-i' }) do
            vim.keymap.set('n', key, dap.step_into, { desc = 'Step [i]nto' })
        end
        for _, key in ipairs({ '<F7>', '-u' }) do
            vim.keymap.set('n', key, dap.step_out, { desc = 'Step o[u]t' })
        end
        for _, key in ipairs({ '<F5>', 'dr' }) do
            vim.keymap.set('n', key, dap.run_to_cursor, { desc = 'Run to cursor' })
        end
        vim.keymap.set(
            'n',
            '<leader>db',
            function() dap.toggle_breakpoint() end,
            { desc = 'Toggle [b]reakpoint' }
        )
        -- vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Open [R]EPL' })
        vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'Run [l]ast' })
        vim.keymap.set({ 'n', 'v' }, '<leader>dh', require('dap.ui.widgets').hover, { desc = '[H]over' })
        vim.keymap.set({ 'n', 'v' }, '<leader>dp', require('dap.ui.widgets').preview)
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