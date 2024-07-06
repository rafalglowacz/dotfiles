return {
    -- 'folke/which-key.nvim',
    'rafalglowacz/which-key.nvim',
    event = 'VimEnter',
    config = function()
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').register {
            ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[R]un', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
            ['<leader>t'] = { name = '[T]esting', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            ['-r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        }
    end,
}