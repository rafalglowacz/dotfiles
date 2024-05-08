let mapleader = " "

set which-key
set notimeout

set number
set relativenumber

set clipboard+=unnamed

set noincsearch
set hlsearch
set scrolloff=15
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

vnoremap > >gv
vnoremap < <gv

nnoremap <Esc> :nohlsearch<CR><Esc>
nnoremap U <C-r>

:map <leader>,  :source ~/.ideavimrc<CR>

:map <leader><leader> <Action>(RecentFiles)
:map <leader>p  <Action>(ManageRecentProjects)

:map <leader>sc <Action>(GotoClass)
:map <leader>sf <Action>(GotoFile)
:map <leader>ws <Action>(GotoSymbol)

:map <leader>g <Action>(Git.Menu)

:map <leader>td <Action>(Debug)
:map <leader>tn <Action>(Run)
