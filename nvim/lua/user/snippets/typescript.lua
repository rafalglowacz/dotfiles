local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('typescript', {
  s('l', fmt('console.log({});', { i(0) })),
})
