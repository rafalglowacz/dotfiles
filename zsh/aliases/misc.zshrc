alias art='php artisan'

! which bat >> /dev/null && 
    alias bat='batcat -p'

alias clearall="printf '\033[2J\033[3J\033[1;1H'"
alias clip="$COPY_CMD"
alias diff='diff --color=always'
alias fgn='jobs | read _jobs; fg; notify-command-done "$_jobs"'

! which hx >> /dev/null && 
    alias hx='helix'
    
alias jq='jq -C'
alias k='kubectl'

alias ls='eza --icons --group-directories-first -a --hyperlink'
alias lh='ls -lh --time-style relative'
alias lhiso='lh --time-style long-iso'
alias l1='ls -1'

alias phpv='php --version'
alias rgp='rg --engine pcre2'

if which thefuck > /dev/null; then
  eval $(thefuck --alias)
  alias wat=fuck
fi

alias watch='watch '
alias vim='nvim'
