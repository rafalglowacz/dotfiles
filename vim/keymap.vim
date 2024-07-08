let mapleader = " "

"--------------------------
" Editor - moving around -
"------------------------

nmap ge G
vmap ge G

" Start rectangular selection with something else than Ctrl+V.
nmap <A-v> <C-v>
" One more way.
nmap <leader>v <C-v>

" Clear search highlight on Esc.
nnoremap <silent><Esc> :nohlsearch<CR><Esc>

nnoremap gg gg0
vnoremap gg gg0

" Alternative to Home/End
nmap gh _
nmap gl $
vmap gh _
vmap gl $

" Center view after certain movements.
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap G G$zz
vnoremap G G$zz

nmap <A-h> <C-w><C-h>
nmap <A-j> <C-w><C-j>
nmap <A-k> <C-w><C-k>
nmap <A-l> <C-w><C-l>

"-----------
" Editing -
"---------

" Keep selection when indenting
vnoremap > >gv
vnoremap < <gv

" More convenient redo, taken from Helix
nnoremap U <C-r>

" Make db/cb also include current character.
nnoremap db vbd
nnoremap cb vbc

" Disable unwanted copying where only pasting/deletion is intended.
vnoremap p "_dP
vnoremap c "_c
nnoremap x "_x
nnoremap C "_C
nnoremap ci "_ci
nnoremap cG "_cG

" Add alternative bindings for deletion where copying isn't always intended.
nnoremap <A-d><A-d> "_dd
vnoremap <A-d> "_d

" Maintain the cursor position when copying a visual selection.
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

noremap! <S-Enter> <Esc>ko
noremap! <C-Enter> <Esc>o

"------------------
" Saving/exiting -
"----------------

noremap! <Esc> <Esc>:w<CR>

if !has('ide')
    noremap  <C-q> <Esc>:qa<CR>
    noremap! <C-s> <Esc>:w<CR>a
    noremap  <C-s> :w<CR>
    " Close bottom panel. This doesn't check if there actually is more than 1 panel
    " and also assumes we don't have any top/bottom splits.
    nnoremap <S-Esc> <C-w><C-j>:q<CR>
endif
