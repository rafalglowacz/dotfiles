return {
    {
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                javascript = { 'eslint_d' },
                typescript = { 'eslint_d' },
            }

            vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                group = vim.api.nvim_create_augroup('lint', { clear = true }),
                callback = function()
                    if vim.opt_local.modifiable:get() then
                        lint.try_lint()
                    end
                end,
            })
        end,
    },
}
