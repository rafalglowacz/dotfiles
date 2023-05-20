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
    }
  },
  i = {
    [';;'] = '<Esc>A;',
    [',,'] = '<Esc>A,',
  },
}

