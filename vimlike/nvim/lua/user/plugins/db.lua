return {
    'kndndrj/nvim-dbee',
    dependencies = { 'MunifTanjim/nui.nvim' },
    build = function()
        -- That didn't work for me. This did: :lua require('dbee').install('go')
        require('dbee').install()
    end,
    config = function()
        require('dbee').setup({
            sources = {
                require('dbee.sources').FileSource:new(
                    vim.fn.stdpath('config')..'/data/dbee-sources.json'
                ),
            },
        })
    end,
    keys = {
        { '<leader>7', '<Cmd>:Dbee toggle<CR>' },
    },
}
