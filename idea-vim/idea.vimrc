let mapleader = " "

set which-key
set notimeout

set number
set relativenumber

set clipboard^=unnamedplus

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

" Disable unwanted copying where only pasting/deletion is intended.
vnoremap p "_dP
nnoremap x "_x
nnoremap C "_Da

" Add alternative bindings for deletion where copying isn't always intended.
nnoremap <A-d><A-d> "_dd
vnoremap <A-d> "_d

:map <C-Up>   <Action>(EditorScrollUp)
:map <C-Down> <Action>(EditorScrollDown)

:map <leader>,  :source ~/.ideavimrc<CR>

:map <leader><leader> <Action>(RecentFiles)
:map <leader>P  <Action>(ManageRecentProjects)

:map <leader>sc <Action>(GotoClass)
:map <leader>c  <Action>(GotoClass)
:map <leader>sf <Action>(GotoFile)
:map <leader>f  <Action>(GotoFile)
:map <leader>ws <Action>(GotoSymbol)

:map <leader>gg <Action>(Git.Menu)
:map <leader>gh <Action>(Vcs.RollbackChangedLines)

:map <leader>td <Action>(Debug)
:map <leader>tn <Action>(RunClass)
:map <leader>tl <Action>(Run)

:map <leader>1  <Action>(ActivateProjectToolWindow)
:map <leader>3  <Action>(ActivateFindToolWindow)
:map <leader>4  <Action>(ActivateRunToolWindow)
:map <leader>5  <Action>(ActivateDebugToolWindow)
:map <leader>9  <Action>(ActivateVersionControlToolWindow)
:map <leader>0  <Action>(ActivateCommitToolWindow)
