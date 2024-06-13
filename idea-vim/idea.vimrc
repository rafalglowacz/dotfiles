" General
let mapleader = " "

": Overlay with key binding tips:
set which-key
set notimeout

": Joining lines with editor's native joining instead off Vim's:
set ideajoin

set hlsearch
set ignorecase
set number
set relativenumber
set scrolloff=15
set smartcase
set iskeyword+=-

set clipboard^=unnamedplus

": make left/right movements wrap across lines
set whichwrap+=h,l

Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 1000

" IJKL
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

nmap gj <Action>(EditorLineStart)
nmap gl <Action>(EditorLineEnd)
vmap gj _
vmap gl $

nnoremap H I
vnoremap H I
nnoremap I H
vnoremap I H

nnoremap yh yi
nnoremap ch "_ci
nnoremap dh di

nnoremap yi <Nop>
nnoremap ci <Nop>
nnoremap di <Nop>

" Editor - moving around

nmap     ge        G
nmap     gt        <Action>(GotoTest)
nmap     A         <Action>(EditorLineEnd)a
 map     n         <Action>(FindNext)
 map     N         <Action>(FindPrevious)
nmap     /         <Action>(Replace)
vmap     /         <Action>(Replace)
nmap     <leader>bb <Action>(ToggleBookmark)
nmap     <leader>bp <Action>(GotoPreviousBookmarkInEditor)
nmap     <leader>bn <Action>(GotoNextBookmarkInEditor)
nmap     zz         zz<Action>(EditorScrollDown)<Action>(EditorScrollDown)<Action>(EditorScrollDown)<Action>(EditorScrollDown)<Action>(EditorScrollDown)

": Start rectangular selection with something else than Ctrl+V.
nmap     <A-v>     <C-v>
": One more way:
nmap     <leader>v <C-v>

nmap     <C-o>     <Action>(Back)
nmap     <C-i>     <Action>(Forward)
map      <C-Up>    <Action>(EditorScrollUp)
map      <C-Down>  <Action>(EditorScrollDown)

map      <Home>    <Action>(EditorLineStart)
imap     <Home>    <Action>(EditorLineStart)
map      <End>     <Action>(EditorLineEnd)
imap     <End>     <Action>(EditorLineEnd)

nmap     <leader>h <Action>(HighlightUsagesInFile)
vmap     <leader>h <Action>(HighlightUsagesInFile)<Esc>

": Clear search highlight on Esc
nnoremap <Esc>     :nohlsearch<CR><Esc>
": Save on Esc
inoremap <Esc>     <Esc>:w<CR>

" Global navigation
map <leader><leader> <Action>(RecentFiles)
map <leader>q  :q<CR>

map <leader>sc <Action>(GotoClass)
map <leader>;  <Action>(GotoClass)
map <leader>sf <Action>(GotoFile)
map <leader>f  <Action>(GotoFile)
map <leader>F  <Action>(SelectInProjectView)
map <leader>ws <Action>(GotoSymbol)

" Editing

". Keep selection when indenting
vnoremap > >gv
vnoremap < <gv

nnoremap U <C-r>

". Make db/cb also include current character.
nnoremap db vbd
nnoremap cb vbc

". Disable unwanted copying where only pasting/deletion is intended.
vnoremap p "_dP
vnoremap c "_c
nnoremap x "_x
nnoremap C "_C
nnoremap cG "_cG

". Add alternative bindings for deletion where copying isn't always intended.
nnoremap <A-d><A-d> "_dd
vnoremap <A-d> "_d

". Maintain the cursor position when copying a visual selection.
". http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

vmap gc <Action>(CommentByLineComment)
nmap gcc <Action>(CommentByLineComment)

" Context-aware editing
map <leader>cr <Action>(RenameElement)

" Debugging
map <leader>db <Action>(ToggleLineBreakpoint)
map <leader>de <Action>(EvaluateExpression)
map <leader>dl <Action>(PhpListenDebugAction)
map <leader>ds <Action>(Stop)
map <leader>dr <Action>(RunToCursor)

" Git
map  <leader>gg <Action>(Git.Menu)
map  <leader>gb <Action>(GitToolBox.BlameDetails)
map  <leader>gh <Action>(Vcs.RollbackChangedLines)

": Preview diff under cursor:
nmap <leader>gP <Action>(VcsShowCurrentChangeMarker)

nmap ]g <Action>(VcsShowNextChangeMarker)
nmap [g <Action>(VcsShowPrevChangeMarker)

" PhpStorm
map <leader>P  <Action>(ManageRecentProjects)
map <leader>/  <Action>(GotoAction)
map <leader>,  :source ~/.ideavimrc<CR>

" Testing
map <leader>td <Action>(Debug)

": Run nearest test:
map <leader>tn <Action>(RunClass)

": Run last test:
map <leader>tl <Action>(Run)

map <leader>tc <Action>(Coverage)
map <leader>tr <Action>(RerunFailedTests)

" Tool windows
map <leader>1  <Action>(ActivateProjectToolWindow)
map <leader>2  <Action>(ActivateBookmarksToolWindow)
map <leader>3  <Action>(ActivateFindToolWindow)
map <leader>4  <Action>(ActivateRunToolWindow)
map <leader>5  <Action>(ActivateDebugToolWindow)
map <leader>9  <Action>(ActivateVersionControlToolWindow)
": Using CheckinProject instead of ActivateCommitToolWindow to make all files
": automatically selected
map <leader>0  <Action>(CheckinProject)
