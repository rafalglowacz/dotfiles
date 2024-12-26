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
        'filetype',
    },
    lualine_y = {
        -- function ()
        --     return '󰅭 ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or '')
        -- end,
    },
    lualine_z = {
        'diff',
    },
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
            disabled_filetypes = {
                -- Sidebars
                'CHADTree',
                'NvimTree',

                'help',
                -- Treesitter inspector
                'query',
            },
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
            lualine_x = {},
            lualine_y = {
                {
                    'branch',
                    fmt = function(branch)
                        local limit = 25
                        return string.len(branch) > limit
                            and branch:sub(1, limit - 1)..'…'
                            or branch
                    end
                },
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
