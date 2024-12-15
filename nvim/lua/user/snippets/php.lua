local ls = require 'luasnip'
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('php', {
  ls.snippet(
    'inf',
    fmt(
      'info("[rafal-tmp] {}");',
      { i(0) }
    )
  ),
})
