let mapleader = " "

"-------------------------------
" Disabling built-in bindings -
" ----------------------------

" Increasing intentation - free up for completion.
noremap! <C-t> <Nop>
" Redo - free up for symbol search.
nnoremap <C-r> <Nop>

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

nmap <C-up>    <C-w><C-k>
nmap <C-left>  <C-w><C-h>
nmap <C-down>  <C-w><C-j>
nmap <C-right> <C-w><C-l>

nnoremap <leader>w :set wrap!<CR>

" Rant: Vim doesn't allow remapping Esc in insert mode and its default behavior
" is weird - even if you didn't do anything since entering this mode, the caret
" won't be on the same character as before, it'll be the one to the left.
" Somehow it's considered correct behavior and no built-in option to change
" it is provided. But press <Esc>i a few times and you'll see why it's ridiculous.
" One thing that's suggested to get around it, or even as something worth
" doing in general, is to take a sequence that doesn't usually occur in typed
" text and mapping it to Esc and whatever you want to get the desired outcome.
" Here's an example that achieves keeping the caret in one place. It works,
" but it makes the typing experience unpleasant. When typing a word with a
" "j", for example "just", you'll get what you want, but the caret will behave
" differently for a split second. It'll look like it goes back and highlights
" a character. If you linger for a moment and Which Key's popup shows, the "j"
" will disappear. So eventually I decided to abandon this attempt.
"imap jj <Esc>`^

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
    noremap  <C-q> <Esc>:wqa<CR>
    noremap! <C-s> <Esc>:wa<CR>a
    noremap! <D-s> <Esc>:wa<CR>a
    noremap  <C-s> :wa<CR>
    noremap  <D-s> :wa<CR>
    " Close bottom panel. This doesn't check if there actually is more than 1 panel
    " and also assumes we don't have any top/bottom splits.
    nnoremap <S-Esc> <C-w><C-j>:q<CR>
endif
