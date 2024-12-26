return {
    enabled = false,

    'ms-jpq/chadtree',
    keys = {
        { '<A-1>', '<Cmd>:CHADopen --always-focus<CR>', desc = 'File explorer' },
        { '<leader>F', '<Cmd>:CHADopen --always-focus<CR>', desc = 'File explorer' },
    },
    config = function()
        vim.api.nvim_set_var("chadtree_settings", {
            options = { session = false },
            keymap = {
                secondary = { '<right>' },
                collapse = { '<left>' },
                toggle_version_control = { 'g' },
            },
            view = {
                open_direction = 'right',
                width = 35,
            },
        })
    end
}
