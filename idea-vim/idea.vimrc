source ~/.config/vim/vimrc

" Overlay with key binding tips:
set which-key
set notimeout

" Joining lines with editor's native joining instead off Vim's:
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

" Context-aware editing
map <leader>cr <Action>(Refactorings.QuickListPopupAction)
map <leader>cn <Action>(RenameElement)

" Debugging
map <leader>db <Action>(ToggleLineBreakpoint)
map <leader>dB <Action>(EditBreakpoint)
map <leader>de <Action>(EvaluateExpression)
map <leader>dl <Action>(PhpListenDebugAction)
map <leader>dd <Action>(Resume)

map -i <Action>(StepInto)
map -o <Action>(StepOver)
map -u <Action>(StepOut)
map -c <Action>(RunToCursor)

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
