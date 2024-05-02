let mapleader = " "

set which-key
set notimeout

set clipboard+=unnamed
set scrolloff=5

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

nnoremap U C-R

:map <leader>tn <Action>(Run)