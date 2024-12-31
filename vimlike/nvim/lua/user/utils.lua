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

return M
