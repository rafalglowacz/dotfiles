local ls = require 'luasnip'
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('javascript', {
  ls.snippet(
    'l',
    fmt(
      'console.log({});',
      { i(0) }
    )
  ),
})
