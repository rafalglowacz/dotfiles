return {
    'adalessa/laravel.nvim',
    dependencies = {
        'tpope/vim-dotenv',
        'nvim-telescope/telescope.nvim',
        'MunifTanjim/nui.nvim',
        'kevinhwang91/promise-async',
    },
    cmd = { 'Laravel' },
    keys = {
        { '<leader>la', ':Laravel artisan<cr>' },
        { '<leader>lr', ':Laravel routes<cr>' },
        { '<leader>lm', ':Laravel related<cr>' },
    },
    event = { 'VeryLazy' },
    config = function()
        local get_env = require('laravel.utils').get_env
        local combine_tables = require("laravel.utils").combine_tables
        local definitions = require('laravel.options.environments').definitions
        local workdir = get_env('APP_WORKDIR') and { '--workdir', get_env('APP_WORKDIR') } or {}

        table.insert(definitions, {
            name = 'docker',
            commands = {
                {
                    commands = { 'php', 'composer', 'npm' },
                    docker = {
                        container = { env = 'APP_CONTAINER', },
                        exec = combine_tables({ 'docker', 'exec' }, workdir, { '-i' }),
                    },
                },
            },
        })

        require('laravel').setup {
            environments = { definitions = definitions },
        }
    end,
}
