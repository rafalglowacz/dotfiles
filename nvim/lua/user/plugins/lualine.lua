local winbar = {
    lualine_a = {},
    lualine_b = {
        {
            'aerial',
            draw_empty = true,
            fmt = function(output)
                if string.len(output) > 0 then
                    return output
                end
                local ok, devicons = pcall(require, 'nvim-web-devicons')
                if ok == false then
                    return ''
                end
                local icon = devicons.get_icon(vim.fn.expand('%:t'))
                return icon == nil and '' or icon
            end
        },
    },
    lualine_c = {},
    lualine_x = {
        function ()
            return '󰅭 ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or '')
        end,
    },
    lualine_y = {
        {
            function()
                return vim.api.nvim_call_function(
                    'fnamemodify',
                    { vim.fn.getcwd(), ':~' }
                )
            end,
        },
    },
    lualine_z = {},
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
    },
    lazy = false,
    opts = {
        options = { 
            globalstatus = true,
            disabled_filetypes = { 'CHADTree' },
        },
        extensions = { 'aerial' },
        sections = {
            lualine_a = {
                { 'mode', fmt = function(str) return str:sub(1, 1) end },
            },
            lualine_b = {
                'diagnostics',
            },
            lualine_c = {
                { 'filename', path = 1 },
            },
            lualine_x = { 'filetype' },
            lualine_y = {
                'branch',
                'diff',
            },
            lualine_z = {
                'progress',
                'location',
            },
        },
        winbar = winbar,
        inactive_winbar = winbar,
    },
}
