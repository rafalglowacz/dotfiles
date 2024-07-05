let mapleader = " "

"--------------------------
" Editor - moving around -
"------------------------

nmap ge G

" Start rectangular selection with something else than Ctrl+V.
nmap <A-v> <C-v>
" One more way:
nmap <leader>v <C-v>

" Clear search highlight on Esc
nnoremap <Esc> :nohlsearch<CR><Esc>

"-----------
" Editing -
"---------

" Keep selection when indenting
vnoremap > >gv
vnoremap < <gv

nnoremap U <C-r>

" Make db/cb also include current character.
nnoremap db vbd
nnoremap cb vbc

" Disable unwanted copying where only pasting/deletion is intended.
vnoremap p "_dP
vnoremap c "_c
nnoremap x "_x
nnoremap C "_C
nnoremap cG "_cG

" Add alternative bindings for deletion where copying isn't always intended.
nnoremap <A-d><A-d> "_dd
vnoremap <A-d> "_d

" Maintain the cursor position when copying a visual selection.
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Save on Esc
inoremap <Esc> <Esc>:w<CR>
