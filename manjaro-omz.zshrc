# Initialize environment-dependent variables
[ -f $0 ] && [ -f $(dirname $0)/.zshrc-env ] && source $(dirname $0)/.zshrc-env
[ -f ~/.zshrc-env ] && source ~/.zshrc-env
if [ -z $LARADOCK_DIR ]; then LARADOCK_DIR=$HOME/Dev/laradock; fi
if [ -z $LARADOCK_SHELL ]; then LARADOCK_SHELL=zsh; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Some nice informative ones are: amuse candy aussiegeek
ZSH_THEME="candy"
export ZSH_COMMAND_TIME_COLOR=grey

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	colored-man-pages
	extract
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	command-time
)

source $ZSH/oh-my-zsh.sh

HISTSIZE=11000
SAVEHIST=10000
setopt APPEND_HISTORY
unsetopt SHARE_HISTORY

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## DNF aliases
alias i='sudo dnf install -y'
alias s='sudo dnf search'

## Laradock aliases
alias workspace="cd $LARADOCK_DIR; docker-compose exec --user laradock workspace $LARADOCK_SHELL"
alias wsr="cd $LARADOCK_DIR; docker-compose exec workspace $LARADOCK_SHELL"
alias ws='workspace'

## Git aliases
alias g='git'
alias gs='git status'
alias gd='git diff -w HEAD'
alias gpf='git push --force'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gcv='git-commit'
alias gcav='git-commit -a'
alias gcava='git commit -av --amend'
alias gcp='git commit -pv'
alias gpuoh='git push -u origin HEAD'
alias gmnn='git merge --no-commit --no-ff && git stash && git stash apply'
alias good='git bisect good'
alias bad='git bisect bad'

## Docker aliases
alias dc='docker compose'
alias mc='mutagen-compose'
alias sail='bash vendor/bin/sail'

## Vim aliases
alias vim='nvim'

## Misc aliases
alias clearall="printf '\033[2J\033[3J\033[1;1H'"
alias clip='xclip -sel clip'
alias k='kubectl'
alias lh='exa -lh'
alias watch='watch '
alias diff='diff --color=always'
alias asno='apt search --names-only'
alias jq='jq -C'
alias art='php artisan'
alias migrate='php artisan migrate'
alias rollback='php artisan migrate:rollback'
! which bat >> /dev/null && alias bat='batcat -p'
alias c='clear'
alias m='mutagen'
alias phpv='php --version'
alias fgn='jobs | read _jobs; fg; notify-command-done "$_jobs"'

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

WORDCHARS='*?_-[]~=;.!@#$%^&(){}<>/\|'
ZLE_REMOVE_SUFFIX_CHARS=""

ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(backward-kill-word backward-kill-dir)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

bindkey \^U backward-kill-line

which pbcopy > /dev/null && copyCmd=pbcopy || copyCmd=wl-copy

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:10:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | $copyCmd)+abort'"
export FZF_DEFAULT_OPTS="--algo=v1 --color=light,hl+:11,hl:3"

command -v fasd > /dev/null && eval "$(fasd --init auto)"

[[ -f /etc/bash_completion.d/docker-machine-prompt.bash ]] && source /etc/bash_completion.d/docker-machine-prompt.bash

# Get this script from https://github.com/wwalker/ssh-find-agent. It doesn't seem to be perfectly compatible with ZSH -
# running `ssh_find_agent` (no arguments) returns an error that traces back to arrays working differently in Bash and
# ZSH. But the part that finds the existing agent works fine, although it didn't work for me at first, only started
# working after reboot.
if [[ $IGNORE_SSH_AGENT_FINDER_IF_NOT_EXISTS != true ]] || [ -f $HOME/bin/ssh-find-agent/ssh-find-agent.sh ]; then
    source $HOME/bin/ssh-find-agent/ssh-find-agent.sh
    ssh_find_agent -a || eval $(ssh-agent) > /dev/null
fi

export LESS='XRi'
export RIPGREP_CONFIG_PATH="$HOME/Dev/dotfiles/ripgreprc"
export GIT_OPTIONAL_LOCKS=0

PATH="$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin:$HOME/bin:$HOME/.cargo/bin:$PATH:$HOME/.local/bin:$HOME/.local/bin/go/bin"
[ -d "$HOME/bin2" ] && PATH="$HOME/bin2:$PATH"
export PATH

export BAT_THEME='gruvbox-dark'

TERM=xterm-256color

# Alt+Backspace
backward-kill-dir () {
    zle vi-backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Alt+Left
backward-word-dir () {
    zle vi-backward-word
}
zle -N backward-word-dir
bindkey "^[[1;3D" backward-word-dir

# Alt+Right
forward-word-dir () {
    zle vi-forward-word
}
zle -N forward-word-dir
bindkey "^[[1;3C" forward-word-dir

[ -f ~/.zshrc-custom ] && source ~/.zshrc-custom

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export GOPATH=~/.local/bin/go

if [ -d /opt/homebrew ]; then
    export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
fi
