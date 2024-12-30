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
                'dap-repl',
                'dapui_breakpoints',
                'dapui_console',
                'dapui_scopes',
                'dapui_watches',
                'dapui_stacks',
                'dbee',
                'help',
                -- Sidebars
                'CHADTree',
                'NvimTree',
                -- Treesitter inspector
                'query',
            },
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' }
        },
        extensions = { 'aerial' },
        sections = {
            lualine_a = {
                { 'mode', fmt = function(str) return str:sub(1, 1) end },
            },
            lualine_b = {
                {
                    function()
                        local status = require('dap').status()
                        if status == '' then return '' end

                        local icon = status:sub(1, 7) == 'Stopped' and '⏸' or '⏵ '
                        return icon..' '..status
                    end,
                    draw_empty = false,
                    color = { fg = 'black', bg = 'orange' },
                    separator = { right = '' }
                },
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
