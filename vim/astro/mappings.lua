return {
  n = {
    ['<Tab>'] = { 
      desc = "Next buffer",
      function() 
        require("astronvim.utils.buffer")
        .nav(vim.v.count > 0 and vim.v.count or 1) 
      end, 
    },
    ['<S-Tab>'] = {
      desc = "Previous buffer",
      function() 
        require("astronvim.utils.buffer")
        .nav(-(vim.v.count > 0 and vim.v.count or 1))
      end,
    },
    ['<A-Down>'] = '<Esc>:move .+1<CR>==',
    ['<A-Up>'] = '<Esc>:move .-2<CR>==',
  },
  i = {
    -- Vim cannot capture these and ",," and ";;" that i had here before have
    -- a weird behavior, sometimes the character disappears and reappears or
    -- doesn't depending on what gets pressed next.
    -- ['<C-;>'] = '<Esc>A;',
    -- ['<C-,>'] = '<Esc>A,',
    ['<A-Down>'] = '<Esc>:move .+1<CR>==gi',
    ['<A-Up>'] = '<Esc>:move .-2<CR>==gi',
  },
  v = {
    ['<'] = '<gv',
    ['>'] = '>gv',
    ['y'] = 'myy`y',
    ['Y'] = 'myY`y',
    ['p'] = '"_dP',
  },
  x = {
    ['<A-Down>'] = ":move '>+1<CR>gv-gv",
    ['<A-Up>'] = ":move '<-2<CR>gv-gv",
  },
}

