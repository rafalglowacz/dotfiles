local M = {}

function M.scroll_after(callback)
    return function()
        callback()
        -- FIXME: This is a workaround.
        -- Defer scrolling a few times. At the time of writing I'm using this
        -- function with LSP and DAP functions. I haven't checked LSP, but DAP
        -- functions don't seem to take callbacks that would allow to reliably
        -- do something right after the async function is done. So I'm scrolling
        -- a few times with increasing timeouts. A large "catch-all" timeout isn't
        -- great as it looks a little jarring when the delay between the content
        -- getting scrolled into view and scrolled to the top is perceptible.
        -- Also, the timeout can't be too small as this can result in
        -- scrolling before the async function finishes.
        for _, timeout in pairs({ 50, 150, 200 }) do
            vim.defer_fn(function() vim.api.nvim_input('zt') end, timeout)
        end
    end
end

--- Copied from `dapui.widgets`
---@param expr nil|string|fun():string
---@return string
function M.eval_expression(expr)
    local mode = vim.api.nvim_get_mode()
    if mode.mode == 'v' then
        -- [bufnum, lnum, col, off]; 1-indexed
        local start = vim.fn.getpos('v')
        local end_ = vim.fn.getpos('.')

        local start_row = start[2]
        local start_col = start[3]

        local end_row = end_[2]
        local end_col = end_[3]

        if start_row == end_row and end_col < start_col then
            end_col, start_col = start_col, end_col
        elseif end_row < start_row then
            start_row, end_row = end_row, start_row
            start_col, end_col = end_col, start_col
        end

        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'n', false)

        -- buf_get_text is 0-indexed; end-col is exclusive
        local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col - 1, end_row - 1, end_col, {})
        return table.concat(lines, '\n')
    end
    expr = expr or '<cexpr>'
    if type(expr) == 'function' then
        return expr()
    else
        return vim.fn.expand(expr)
    end
end

return M
