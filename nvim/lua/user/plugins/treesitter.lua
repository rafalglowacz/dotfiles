-- Make handling of PHP variable names require one fewer steps.
--
-- From Treesitter's point of view the entire variable name includes the dollar
-- sign. TS calls it "variable_name". One level below is "name", which doesn't
-- contain the dollar sign.
--
-- This function forces the selection to skip the nested name and always select
-- the full variable name.
--
-- Note: I'm not checking if the current file type is actually PHP. JS and other
-- languages simply won't have this kind of nesting and if some other language
-- I happen to use does have it then I most likely want the same behavior.
--
-- TODO: also override node_decremental
local function handle_php_var_names()
    local inc_sel = require('nvim-treesitter.incremental_selection')
    local utils = require('nvim-treesitter.ts_utils')
    local orig_handler = inc_sel.node_incremental

    inc_sel.node_incremental = function()
        local start_node = utils.get_node_at_cursor()
        orig_handler()
        -- If the cursor was on the dollar sign, we're done.
        if start_node and start_node:type() == 'variable_name' then
            return
        end

        local node = utils.get_node_at_cursor()
        if node and node:type() == 'name' and node:parent() and node:parent():type() == 'variable_name' then
            orig_handler()
        end
    end
end

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
            auto_install = true,
            ignore_install = { 'gitcommit' },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "v",
                    node_decremental = "V",
                },
            },
        }

        handle_php_var_names()
    end,
}
