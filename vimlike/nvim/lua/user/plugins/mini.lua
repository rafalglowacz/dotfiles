return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.ai').setup {
            n_lines = 500,
            mappings = {
                inside = 'h',
                inside_next = 'hn',
                inside_last = 'hl',
            },
        }
        require('mini.surround').setup()
        local statusline = require 'mini.statusline'
        statusline.setup { use_icons = vim.g.have_nerd_font }
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return '%2l:%-2v'
        end
    end,
}