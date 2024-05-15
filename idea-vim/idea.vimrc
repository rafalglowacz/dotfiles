let mapleader = " "

set which-key
set notimeout
set ideajoin

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

nnoremap yh yi
nnoremap ch ci
nnoremap dh di

nnoremap yi <Nop>
nnoremap ci <Nop>
nnoremap di <Nop>

#

vnoremap > >gv
vnoremap < <gv

nnoremap <Esc> :nohlsearch<CR><Esc>
map / <Action>(Find)

nnoremap U <C-r>
nnoremap ge G

" Disable unwanted copying where only pasting/deletion is intended.
vnoremap p "_dP
nnoremap x "_x
nnoremap C "_Da

" Add alternative bindings for deletion where copying isn't always intended.
nnoremap <A-d><A-d> "_dd
vnoremap <A-d> "_d

" Maintain the cursor position when copying a visual selection.
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

nnoremap <A-v> <C-v>

map n <Action>(FindNext)
map N <Action>(FindPrevious)

map <C-Up>   <Action>(EditorScrollUp)
map <C-Down> <Action>(EditorScrollDown)

map <leader>?  <Action>(GotoAction)
map <leader>,  :source ~/.ideavimrc<CR>

map <leader><leader> <Action>(RecentFiles)
map <leader>P  <Action>(ManageRecentProjects)
map <leader>q  :q<CR>

map <leader>sc <Action>(GotoClass)
map <leader>c  <Action>(GotoClass)
map <leader>sf <Action>(GotoFile)
map <leader>f  <Action>(GotoFile)
map <leader>F  <Action>(SelectInProjectView)
map <leader>ws <Action>(GotoSymbol)

map <leader>db <Action>(ToggleLineBreakpoint)
map <leader>de <Action>(EvaluateExpression)

map <leader>gg <Action>(Git.Menu)
map <leader>gb <Action>(GitToolBox.BlameDetails)
map <leader>gh <Action>(Vcs.RollbackChangedLines)
nmap ]g <Action>(VcsShowNextChangeMarker)
nmap [g <Action>(VcsShowPrevChangeMarker)

map <leader>td <Action>(Debug)
map <leader>tn <Action>(RunClass)
map <leader>tl <Action>(Run)

map <leader>1  <Action>(ActivateProjectToolWindow)
map <leader>3  <Action>(ActivateFindToolWindow)
map <leader>4  <Action>(ActivateRunToolWindow)
map <leader>5  <Action>(ActivateDebugToolWindow)
map <leader>9  <Action>(ActivateVersionControlToolWindow)
map <leader>0  <Action>(ActivateCommitToolWindow)
