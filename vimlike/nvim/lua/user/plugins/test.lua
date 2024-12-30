return {
    'vim-test/vim-test',
    keys = {
        {
            '<leader>rn',
            function() vim.cmd('silent TestNearest') end,
            desc = 'Test [n]earest',
        },
        {
            '<leader>rf',
            function() vim.cmd('silent TestFile') end,
            desc = 'Test [f]ile',
        },
        -- {
        --     '<leader>ts',
        --     function() vim.cmd('silent TestSuite') end,
        --     desc = 'Test [s]uite',
        -- },
        {
            '<leader>rr',
            function() vim.cmd('silent TestLast') end,
            desc = 'Test [l]ast',
        },
        -- {
        --     '<leader>tv',
        --     function() vim.cmd('silent TestVisit') end,
        --     desc = 'Test [v]isit',
        -- },
    },
    config = function()
        vim.g['test#custom_strategies'] = {
            my_kitty = function(cmd)
                ---@diagnostic disable-next-line: param-type-mismatch
                local conf_path = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':p')
                local runner_path = vim.fn.shellescape(conf_path..'bin/kitty-runner')
                local cwd = vim.fn.shellescape(vim.fn.getcwd())

                cmd = 'echo && cd '..cwd..' && '..cmd

                vim.fn.execute(
                    '!'..runner_path..' '..vim.fn.shellescape(cmd),
                    'silent'
                )
            end
        }
        vim.g['test#strategy'] = 'my_kitty'
        vim.g['test#php#phpunit#executable'] = 'de php vendor/bin/phpunit'
    end
}
