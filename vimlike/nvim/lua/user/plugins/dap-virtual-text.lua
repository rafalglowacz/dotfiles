return {
    'theHamsta/nvim-dap-virtual-text',
    config = function ()
        require('nvim-dap-virtual-text').setup({
            all_references = true,
            virt_text_pos = 'eol',
            virt_text_win_col = 80,
            display_callback = function(variable)
                -- No variable name despite not using inline position. Saves space, and
                -- the order of vars in the line is enough to know which value is which.
                return variable.value:gsub('%s+', ' ')
            end
        })
    end,
}
