# Initialize environment-dependent variables
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

HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

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
)

source $ZSH/oh-my-zsh.sh

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

## Laradock aliases
alias workspace="cd $LARADOCK_DIR; docker-compose exec --user laradock workspace $LARADOCK_SHELL"
alias wsr="cd $LARADOCK_DIR; docker-compose exec workspace $LARADOCK_SHELL"

alias ws='workspace'

## Git aliases
alias gs='git status'
alias gd='git diff -w HEAD'
alias gpf='git push --force'
alias grhh='git reset --hard HEAD'
alias gcav='git commit -av && git push'
alias gcava='git commit -av --amend'
alias gpuoh='git push -u origin HEAD'

## Docker aliases
alias dc='docker-compose'
alias de='docker-compose-exec'
alias dm='docker-machine'
alias sail='bash vendor/bin/sail'

## Misc aliases
alias clip='xclip -sel clip'
alias k='kubectl'
alias lh='ls -lh'
alias watch='watch '
alias diff='diff --color=always'
alias asno='apt search --names-only'

WORDCHARS='*?_-[]~=;.!@#$%^&(){}<>/\|'

# This apparently conflicts with concatenating killed text for yanking and requires zsh 5.9 (not yet released as of 2020-09-04) to work correctly.
# See https://github.com/zsh-users/zsh-syntax-highlighting/issues/150
# [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# See https://github.com/zsh-users/zsh-autosuggestions/issues/363
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(backward-kill-word backward-kill-dir)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

bindkey \^U backward-kill-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fasd --init auto)"

[[ -f /etc/bash_completion.d/docker-machine-prompt.bash ]] && source /etc/bash_completion.d/docker-machine-prompt.bash

eval "$(ssh-agent -s)" > /dev/null

export LESS='XRi'
export PATH="$HOME/.config/composer/vendor/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"

# Alt+Backspace
backward-kill-dir () {
    local WORDCHARS=''
    zle backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Alt+Left
backward-word-dir () {
    local WORDCHARS=''
    zle backward-word
}
zle -N backward-word-dir
bindkey "^[[1;3D" backward-word-dir

# Alt+Right
forward-word-dir () {
    local WORDCHARS=''
    zle forward-word
}
zle -N forward-word-dir
bindkey "^[[1;3C" forward-word-dir
