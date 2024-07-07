source ~/.config/vim/vimrc

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

" Context-aware editing
map <leader>cr <Action>(Refactorings.QuickListPopupAction)
map <leader>cn <Action>(RenameElement)

" Debugging
map <leader>db <Action>(ToggleLineBreakpoint)
map <leader>dB <Action>(EditBreakpoint)
map <leader>de <Action>(EvaluateExpression)
map <leader>dL <Action>(PhpListenDebugAction)
map <leader>dc <Action>(Resume)
map <leader>di  <Action>(StepInto)
map <leader>do  <Action>(StepOver)
map <leader>du  <Action>(StepOut)
map <leader>dr <Action>(RunToCursor)

map -i <Action>(StepInto)
map -o <Action>(StepOver)
map -u <Action>(StepOut)
map -r <Action>(RunToCursor)

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
map <leader>,  :source ~/.ideavimrc<CR>

" Testing
map <leader>td <Action>(Debug)

": Run nearest test
map <leader>tn <Action>(RunClass)

": Run last test
map <leader>tl <Action>(Run)

map <leader>tc <Action>(Coverage)
map <leader>tr <Action>(RerunFailedTests)

": Running
map <leader>rr <Action>(ChooseRunConfiguration)
map <leader>rs <Action>(Stop)

" Tool windows
map <leader>1  <Action>(ActivateProjectToolWindow)
map <leader>2  <Action>(ActivateBookmarksToolWindow)
map <leader>3  <Action>(ActivateFindToolWindow)
map <leader>4  <Action>(ActivateRunToolWindow)
map <leader>5  <Action>(ActivateDebugToolWindow)
map <leader>6  <Action>(ActivateProblemsViewToolWindow)
map <leader>9  <Action>(ActivateVersionControlToolWindow)
map <leader>0  <Action>(ActivateCommitToolWindow)

map <leader>E  <Action>(ShowErrorDescription)
map <leader>q  <Action>(ShowIntentionActions)
map <leader>l  <Action>(LocalHistory)

" Handlers
sethandler <C-a> a:ide
sethandler <C-b> a:vim
sethandler <C-d> a:vim
sethandler <C-f> a:vim
sethandler <C-h> n:ide
sethandler <C-i> n:ide
sethandler <C-j> n:ide
sethandler <C-n> a:vim
sethandler <C-o> a:vim
sethandler <C-q> a:ide
sethandler <C-r> n:ide
sethandler <C-s> n:ide
sethandler <C-u> n:ide
sethandler <C-v> a:ide
sethandler <C-w> n:ide
sethandler <C-x> a:ide
sethandler <C-y> a:ide
