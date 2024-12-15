local ls = require 'luasnip'
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('php', {
    ls.snippet(
        'fn',
        fmt(
            'function {}() {{\n'..
                '    {}\n'..
                '}}',
            { i(1), i(0) }
        )
    ),
    ls.snippet(
        'inf',
        fmt(
            'info("[rafal-tmp] {}");',
            { i(0) }
        )
    ),
    ls.snippet(
        'pf',
        fmt(
            'public function {}(): {}\n'..
                '{{\n'..
                '    {}\n'..
                '}}',
            { i(1), i(2, 'void'), i(0) }
        )
    ),
    ls.snippet(
        'pr',
        fmt(
            'private function {}(): {}\n'..
                '{{\n'..
                '    {}\n'..
                '}}',
            { i(1), i(2, 'void'), i(0) }
        )
    ),
})
