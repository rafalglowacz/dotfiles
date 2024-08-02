source ~/.config/vim/vimrc

" Relative numbers aren't useful here, as I bound movement keys to native IDE
" actions which doesn't work with count. So let's have absolute numbers instead.
set norelativenumber

" Also a consequence of using native movements. Scrolloff doesn't
" work with them but some commands still use it (e.g. high/low jumps)
" so let disable it for consistency.
set scrolloff=0

" Overlay with key binding tips:
set which-key
set notimeout

" Joining lines with editor's native joining instead of Vim's:
set ideajoin

Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 1000

" Alternative to Home/End
nmap gh <Action>(EditorLineStart)
nmap gl <Action>(EditorLineEnd)

" Editor - moving around
source ~/.config/ideavim/ijkl.vimrc

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

nmap     <C-o>     <Action>(Back)
nmap     <C-i>     <Action>(Forward)

map      <C-Up>    <Action>(EditorScrollUp)
imap     <C-Up>    <Action>(EditorScrollUp)
map      <C-Down>  <Action>(EditorScrollDown)
imap     <C-Down>  <Action>(EditorScrollDown)

map      <Home>    <Action>(EditorLineStart)
imap     <Home>    <Action>(EditorLineStart)
map      <End>     <Action>(EditorLineEnd)
imap     <End>     <Action>(EditorLineEnd)

nmap     <leader>h <Action>(HighlightUsagesInFile)
vmap     <leader>h <Action>(HighlightUsagesInFile)<Esc>

map <C-u> <Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorScrollToCenter)
map <C-d> <Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorScrollToCenter)

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
vmap gc <Action>(CommentByLineComment)
nmap gcc <Action>(CommentByLineComment)
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
nmap <leader>cA <Action>(StringManipulation.AlignCarets)

" Code intelligence
nmap <C-k> <Action>(ParameterInfo)

" Context-aware editing
map <leader>cr <Action>(Refactorings.QuickListPopupAction)
map <leader>cn <Action>(RenameElement)

" Debugging
map <leader>db <Action>(ToggleLineBreakpoint)
map <leader>dB <Action>(EditBreakpoint)
map <leader>de <Action>(EvaluateExpression)
map <leader>dL <Action>(PhpListenDebugAction)
map <leader>dc <Action>(Resume)
map <leader>dd <Action>(Debug)
map <leader>di <Action>(StepInto)
map <leader>do <Action>(StepOver)
map <leader>du <Action>(StepOut)
map <leader>dr <Action>(RunToCursor)

map -i <Action>(StepInto)
map -o <Action>(StepOver)
map -u <Action>(StepOut)
map -r <Action>(RunToCursor)
map -- <Action>(Resume)

" Git
map  <leader>gg <Action>(Git.Menu)
map  <leader>gb <Action>(GitToolBox.BlameDetails)
map  <leader>gh <Action>(Vcs.RollbackChangedLines)
map  <leader>gH <Action>(Vcs.ShowTabbedFileHistory)
map  <leader>gS <Action>(Vcs.ShowHistoryForBlock)

": Preview diff under cursor:
nmap <leader>gP <Action>(VcsShowCurrentChangeMarker)

nmap ]g <Action>(VcsShowNextChangeMarker)
nmap [g <Action>(VcsShowPrevChangeMarker)
nmap <leader>n <Action>(VcsShowNextChangeMarker)
nmap <leader>p <Action>(VcsShowPrevChangeMarker)

" PhpStorm
map <leader>P  <Action>(ManageRecentProjects)
map <leader>/  <Action>(GotoAction)
map <leader>,  :source ~/.config/ideavim/ideavimrc<CR>

" Running
map <leader>rr <Action>(Run)
map <leader>rR <Action>(ChooseRunConfiguration)
map <leader>rs <Action>(Stop)

" Testing
map <leader>td <Action>(Debug)
map <leader>tn <Action>(RunClass)
map <leader>tl <Action>(Run)
map <leader>tc <Action>(Coverage)
map <leader>tr <Action>(RerunFailedTests)

" Tool windows
map <leader>1  <Action>(ActivateProjectToolWindow)
map <leader>2  <Action>(ActivateBookmarksToolWindow)
map <leader>3  <Action>(ActivateFindToolWindow)
map <leader>4  <Action>(ActivateRunToolWindow)
map <leader>5  <Action>(ActivateDebugToolWindow)
map <leader>6  <Action>(ActivateProblemsViewToolWindow)
map <leader>8  <Action>(ActivateBuildToolWindow)
map <leader>9  <Action>(ActivateVersionControlToolWindow)
map <leader>0  <Action>(ActivateCommitToolWindow)

map <leader>e  <Action>(ShowErrorDescription)
map <leader>q  <Action>(ShowIntentionActions)
map <leader>l  <Action>(LocalHistory)

" Handlers
sethandler <C-a> i:ide
sethandler <C-b> a:vim
sethandler <C-d> i-v:ide
sethandler <C-f> a:vim
sethandler <C-h> n:ide
sethandler <C-i> a:vim
sethandler <C-j> a:ide
sethandler <C-n> a:vim
sethandler <C-o> a:vim
sethandler <C-q> a:ide
sethandler <C-r> n:ide
sethandler <C-s> n:ide
sethandler <C-u> i-v:ide
sethandler <C-v> a:ide
sethandler <C-w> a:ide
sethandler <C-x> i:ide
sethandler <C-y> i:ide
