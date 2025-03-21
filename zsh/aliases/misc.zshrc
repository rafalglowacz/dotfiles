#!/usr/bin/env zsh
alias art='php artisan'

! which bat >> /dev/null &&
    alias bat='batcat -p'

alias clearall="printf '\033[2J\033[3J\033[1;1H'"
alias clip="$COPY_CMD"
alias diff='diff --color=always'
alias fgn='jobs | read _jobs; fg; notify-command-done "$_jobs"'

! which hx >> /dev/null &&
    alias hx='helix'

alias h='history'
alias icat='kitten icat'
alias jq='jq -C'
alias k='kubectl'
alias kssh='kitten ssh'

alias ls='eza --icons --group-directories-first -a --hyperlink'
alias lh='ls -lh --time-style relative'
alias lhiso='lh --time-style long-iso'
alias l1='ls -1'

alias phpv='php --version'
alias rgp='rg --engine pcre2'
alias rover="$HOME/.local/share/JetBrains/Toolbox/apps/rustrover/bin/rustrover.sh"
alias storm="$HOME/.local/share/JetBrains/Toolbox/apps/phpstorm/bin/phpstorm.sh"
alias astro='XDG_CONFIG_HOME=~/.config/nvim-astro XDG_CACHE_HOME=~/.cache/nvim-astro XDG_DATA_HOME=~/.local/share/nvim-astro XDG_STATE_HOME=~/.local/state/nvim-astro nvim'
alias nvim-pager='XDG_CONFIG_HOME=~/.config/nvim-pager XDG_CACHE_HOME=~/.cache/nvim-pager XDG_DATA_HOME=~/.local/share/nvim-pager XDG_STATE_HOME=~/.local/state/nvim-pager nvim'

if which thefuck > /dev/null; then
  eval $(thefuck --alias)
  alias wat=fuck
fi

alias watch='watch '
