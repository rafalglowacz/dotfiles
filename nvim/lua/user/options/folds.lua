local function setup_folds(filetypePattern, cb)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypePattern,
        callback = cb,
    })

    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
            -- After automatic folds have been set, allow setting manual ones.
            vim.wo.foldmethod = 'manual'
        end
    })
end

setup_folds(
    'php',
    function()
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'getline(v:lnum) =~ "^use "'
    end
)

setup_folds(
    {'javascript', 'typescript', 'vue' },
    function()
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'getline(v:lnum) =~ "^import "'
    end
)
