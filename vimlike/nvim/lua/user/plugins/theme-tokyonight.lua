return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('tokyonight').setup{
            transparent = true,
            on_highlights = function (hl)
                if vim.o.background == 'light' then
                    hl.ColorColumn.bg = '#eeeeee'
                    hl.CursorLine.bg = '#eeeeee'
                    hl.LspReferenceRead.bg = '#f1f1f1'
                    hl.LspReferenceWrite.bg = '#f1f1f1'
                    hl.MsgArea.bg = '#dee5f3'
                    -- Debbuger current line
                    hl.debugPC.bg = '#f5daa8'
                else
                    hl.MsgArea.bg = '#1a1a23'
                    hl.debugPC.bg = '#4d3101'
                end
            end
        }
        -- Try also 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
        vim.cmd.colorscheme 'tokyonight-night'
    end,
}
