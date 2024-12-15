local ls = require 'luasnip'
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('lua', {
  ls.snippet(
    'fn',
    fmt(
      'function()\n    {}\nend',
      { i(0) }
    )
  ),
})
