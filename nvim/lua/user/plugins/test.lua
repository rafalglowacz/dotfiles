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
      vim.cmd[[
        function! MyKitty(cmd)
          let confDir = fnamemodify(stdpath('config'), ':p')
          let cmd = join(['cd ' . shellescape(getcwd()), a:cmd], ' &&\n')
          execute 'silent !'.join([
            \ shellescape(confDir . '/bin/kitty-runner'), 
            \ shellescape(cmd)
          \ ])
        endfunction
        let g:test#custom_strategies = {'mykitty': function('MyKitty')}
        let g:test#strategy = 'mykitty'

        " let test#neovim#term_position = 'vert botright 80'
        let test#php#phpunit#executable = 'de php vendor/bin/phpunit'
      ]]
    end
}
