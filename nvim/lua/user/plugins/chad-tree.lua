return {
    'ms-jpq/chadtree',
    keys = {
        { '<Leader>e', '<Cmd>:CHADopen<CR>', desc = 'File [e]xplorer' },
    },
    config = function()
        vim.api.nvim_set_var("chadtree_settings", {
            keymap = {
                toggle_version_control = { 'g' },
            },
            view = {
                open_direction = 'right',
            },
        })
    end
}