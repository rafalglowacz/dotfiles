local function setup_folds(filetype_pattern, setup_callback)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype_pattern:gsub('*.', ''),
        callback = function()
            setup_callback()
        end
    })

    vim.api.nvim_create_autocmd('BufEnter', {
        pattern = filetype_pattern,
        callback = function()
            -- After automatic folds have been set, allow setting manual ones.
            vim.defer_fn(function()
                vim.wo.foldmethod = 'manual'
            end, 0)
        end
    })
end

setup_folds(
    '*.php',
    function()
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'getline(v:lnum) =~ "^use "'
    end
)

for _, type in ipairs({'*.javascript', '*.typescript', '*.vue' }) do
    setup_folds(
        type,
        function()
            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'getline(v:lnum) =~ "^import "'
        end
    )
end
