let mapleader = " "

set which-key
set notimeout

set number
set relativenumber

set clipboard+=unnamed

set noincsearch
set hlsearch
set scrolloff=8
set ignorecase
set smartcase

# IJKL
nnoremap h i
vnoremap h i

nnoremap i gk
vnoremap i gk

nnoremap j h
vnoremap j h

nnoremap k gj
vnoremap k gj

nnoremap l l
vnoremap l l

#

vnoremap < <gv
vnoremap > >gv

nnoremap <lt> <lt>gv
nnoremap <gt> <gt>gv

nnoremap <Esc> :nohlsearch<CR><Esc>
nnoremap U <C-r>

:map <leader>tn <Action>(Run)

:map <leader>sf <Action>(GotoFile)