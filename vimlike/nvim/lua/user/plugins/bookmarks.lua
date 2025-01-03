return {
    'MattesGroeger/vim-bookmarks',
    config = function()
        vim.g.bookmark_save_per_working_dir = 1
        vim.g.bookmark_auto_save = 1
    end
}
