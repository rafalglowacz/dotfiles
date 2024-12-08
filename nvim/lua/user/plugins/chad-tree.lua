return {
    'ms-jpq/chadtree',
    keys = {
        { '<Leader>e', '<Cmd>:CHADopen --always-focus<CR>', desc = 'File [e]xplorer' },
    },
    config = function()
        vim.api.nvim_set_var("chadtree_settings", {
            keymap = {
                secondary = { '<right>' },
                collapse = { '<left>' },
                toggle_version_control = { 'g' },
            },
            view = {
                open_direction = 'right',
                width = 30,
            },
        })
    end
}
