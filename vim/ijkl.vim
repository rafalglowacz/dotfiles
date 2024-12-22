" Basic IJKL (no binding for "l", it already matches).
nnoremap i gk
vnoremap i gk

nnoremap j h
vnoremap j h

nnoremap k gj
vnoremap k gj

" Alternative to Home/End.
nmap gj gh
vmap gj gh

" Moving between panes.
nmap <A-i> <C-w><C-k>
nmap <A-j> <C-w><C-h>
nmap <A-k> <C-w><C-j>

" Goto-top binding. To consider: change goto-bottom to K?
nnoremap I H
vnoremap I H

" Insert mode and other editing bindings
nnoremap h i
vnoremap h i
nnoremap H I
vnoremap H I

nnoremap yh yi
nnoremap ch "_ci
nnoremap dh di

nnoremap yi <Nop>
nnoremap ci <Nop>
nnoremap di <Nop>
