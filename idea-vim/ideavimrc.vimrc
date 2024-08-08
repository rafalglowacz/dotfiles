"-------------
" BASE CONFIG
"-----------
source ~/.config/vim/vimrc

"---------
" OPTIONS
"-------

" Relative numbers aren't useful here, as I bound movement keys to native IDE
" actions which don't work with count. So let's have absolute numbers instead.
set norelativenumber

" Also a consequence of using native movements. Scrolloff doesn't
" work with them but some commands still use it (e.g. high/low jumps)
" so let's disable it for consistency.
set scrolloff=0

" Overlay with key binding tips:
set which-key
set notimeout

" Joining lines with editor's native joining instead of Vim's:
set ideajoin

"---------
" PLUGINS
"-------

Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 1000

"--------------
" KEY BINDINGS
"------------

"------------------------
" Editor - moving around
"----------------------

" Alternative to Home/End
nmap gh <Action>(EditorLineStart)
nmap gl <Action>(EditorLineEnd)

source ~/.config/ideavim/ijkl.vimrc

nmap gt <Action>(GotoTest)
nmap A  <Action>(EditorLineEnd)a
 map n  <Action>(FindNext)
 map N  <Action>(FindPrevious)
nmap /  <Action>(Replace)
vmap /  <Action>(Replace)

nmap <leader>bb <Action>(ToggleBookmark)
nmap <leader>bp <Action>(GotoPreviousBookmarkInEditor)
nmap <leader>bn <Action>(GotoNextBookmarkInEditor)

" Scroll to make it not technically centered, but more in the line of sight.
nmap zz zz<Action>(EditorScrollDown)<Action>(EditorScrollDown)<Action>(EditorScrollDown)<Action>(EditorScrollDown)<Action>(EditorScrollDown)

" Put current line on top, but scroll a few times to avoid the caret getting
" hidden behind sticky lines. The number of scroll actions should be at least
" as much as the number of the configured sticky lines.
nmap zt zt<Action>(EditorScrollUp)<Action>(EditorScrollUp)<Action>(EditorScrollUp)<Action>(EditorScrollUp)<Action>(EditorScrollUp)

nmap <C-o>    <Action>(Back)
nmap <C-i>    <Action>(Forward)

map  <C-Up>   <Action>(EditorScrollUp)
imap <C-Up>   <Action>(EditorScrollUp)
map  <C-Down> <Action>(EditorScrollDown)
imap <C-Down> <Action>(EditorScrollDown)

map  <Home>   <Action>(EditorLineStart)
imap <Home>   <Action>(EditorLineStart)
map  <End>    <Action>(EditorLineEnd)
imap <End>    <Action>(EditorLineEnd)

nmap <leader>h <Action>(HighlightUsagesInFile)
vmap <leader>h <Action>(HighlightUsagesInFile)<Esc>

map <C-u> <Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)<Action>(EditorUp)
map <C-d> <Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)<Action>(EditorDown)

map mm <Action>(EditorMatchBrace)

"-------------------
" Global navigation
"-----------------

map <leader><leader> <Action>(Switcher)
map <leader><S-Space> <Action>(RecentFiles)

map <leader>;  <Action>(GotoClass)
map <leader>f  <Action>(GotoFile)
map <leader>F  <Action>(SelectInProjectView)

"---------
" Editing
"-------

nmap <leader>cA <Action>(StringManipulation.AlignCarets)

map <S-Space> <Action>(EditorSelectWord)
map <C-Space> <Action>(EditorUnSelectWord)

"-------------------
" Code intelligence
"-----------------

nmap <C-k>      <Action>(ParameterInfo)
map  <leader>cr <Action>(Refactorings.QuickListPopupAction)
map  <leader>cn <Action>(RenameElement)

"-----
" Git
"---

map  <leader>gg <Action>(Git.Menu)
map  <leader>gb <Action>(GitToolBox.BlameDetails)
map  <leader>gh <Action>(Vcs.RollbackChangedLines)
map  <leader>gH <Action>(Vcs.ShowTabbedFileHistory)
map  <leader>gS <Action>(Vcs.ShowHistoryForBlock)
" Preview diff under cursor:
nmap <leader>gP <Action>(VcsShowCurrentChangeMarker)

nmap <leader>n <Action>(VcsShowNextChangeMarker)
nmap <leader>p <Action>(VcsShowPrevChangeMarker)

"-----
" IDE
"---

map <leader>P  <Action>(ManageRecentProjects)
map <leader>/  <Action>(GotoAction)
map <leader>,  :source ~/.config/ideavim/ideavimrc<CR>

"---------
" Running
"-------

" Run (most recent)
map <leader>rr <Action>(Run)
" Run nearest
map <leader>rn <Action>(RunClass)
map <leader>rR <Action>(ChooseRunConfiguration)
map <leader>rs <Action>(Stop)

" Test-specific
map <leader>tc <Action>(Coverage)
map <leader>tr <Action>(RerunFailedTests)

" Debugging-specific
" Debug (most recent)
map <leader>dd <Action>(Debug)
map <leader>db <Action>(ToggleLineBreakpoint)
map <leader>dg <Action>(ToggleBreakpointEnabled)
map <leader>dB <Action>(EditBreakpoint)
map <leader>de <Action>(EvaluateExpression)
map <leader>dL <Action>(PhpListenDebugAction)

map -i <Action>(StepInto)
map -o <Action>(StepOver)
map -u <Action>(StepOut)
map -c <Action>(RunToCursor)
map -- <Action>(Resume)
map -e <Action>(EvaluateExpression)

"--------------
" Tool windows
"------------

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

"------
" View
"----

map <leader>w <Action>(EditorToggleUseSoftWraps)

"----------
" Handlers
"--------

sethandler <C-a> i:ide
sethandler <C-b> a:vim

" Let Vim handle Ctrl+D in normal mode, but allow the IDE to create selections
" from word under cursor in the insert mode. We have to also let the IDE handle
" the visual mode as creating the first selections automatically switches to it.
sethandler <C-d> i-v:ide

sethandler <C-f> a:vim
sethandler <C-h> a:ide
sethandler <C-i> a:vim
sethandler <C-j> a:ide
sethandler <C-n> a:ide
sethandler <C-o> a:vim
sethandler <C-q> a:ide
sethandler <C-r> n:ide
sethandler <C-s> n:ide
sethandler <C-u> i:ide
sethandler <C-v> a:ide
sethandler <C-w> a:ide
sethandler <C-x> i:ide
sethandler <C-y> i:ide
