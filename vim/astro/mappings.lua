return {
  n = {
    ['<Tab>'] = { 
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, 
      desc = "Next buffer" 
    },
    ['<S-Tab>'] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    }
  },
  i = {
    [';;'] = '<Esc>A;',
    [',,'] = '<Esc>A,',
  },
}

