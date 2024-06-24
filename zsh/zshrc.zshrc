# This config's real directory path, even if symlinked.
ZSHRC_DIR=$(dirname $(realpath ${funcsourcetrace[1]%:*}))

##############
# Oh My ZSH #
############

plugins=(
	colored-man-pages
	copybuffer
	extract
	git
	timer
	zsh-autosuggestions
	zsh-syntax-highlighting
	z
)

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="candy"
source $ZSH/oh-my-zsh.sh
source $ZSHRC_DIR/configs/omz-termsupport-preexec.zshrc

############
# General #
##########

WORDCHARS='*?_-[]~=;.!@#$%^&(){}<>/\|'
# Disable removal of space character after using tab completion and entering 
# the next character. See https://superuser.com/q/613685
ZLE_REMOVE_SUFFIX_CHARS=""
# See also omz-termsupport-preexec-custom.zshrc
ZSH_THEME_TERM_TITLE_IDLE="%~"
setopt GLOB_DOTS
zstyle ':completion:*' ignored-patterns '(.|..)'

source $ZSHRC_DIR/configs/precmd.zshrc
source $ZSHRC_DIR/configs/plugins.zshrc
source $ZSHRC_DIR/configs/prompt.zshrc
source $ZSHRC_DIR/shortcuts.zshrc

##################
# Custom config #
################

which pbcopy > /dev/null && COPY_CMD=pbcopy || COPY_CMD=wl-copy

############
# History #
##########

HISTSIZE=100100
SAVEHIST=100000
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
unsetopt SHARE_HISTORY

#########
# Path #
#######

MY_PATH="$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin"
MY_PATH="$MY_PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/bin/go/bin"
if [ -d "$HOME/bin2" ]; then 
	MY_PATH="$MY_PATH:$HOME/bin2"
fi
if [ -d /opt/homebrew ]; then
    MY_PATH="$MY_PATH:/opt/homebrew/opt/mysql-client/bin:/opt/homebrew/opt/ruby/bin"
fi
export PATH="$MY_PATH:$PATH"

#########
# Apps #
#######

export LESS='XRi'
export RIPGREP_CONFIG_PATH=$ZSHRC_DIR/../ripgreprc
export GIT_OPTIONAL_LOCKS=0
export GOPATH=~/.local/bin/go
if [ -z $KITTY_LISTEN_ON ]; then
	export KITTY_LISTEN_ON=unix:/tmp/kitty-remote-control-$PPID
fi

source $ZSHRC_DIR/configs/fnm.zshrc
source $ZSHRC_DIR/configs/fzf.zshrc
source $ZSHRC_DIR/configs/nvm.zshrc

# Haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

############
# Aliases #
##########

source $ZSHRC_DIR/aliases/git.zshrc
source $ZSHRC_DIR/aliases/docker.zshrc
source $ZSHRC_DIR/aliases/misc.zshrc
source $ZSHRC_DIR/aliases/system.zshrc

[ -f $ZSHRC_DIR/aliases/local.zshrc ] && source $ZSHRC_DIR/aliases/local.zshrc

#############################
# Local (see also Aliases) #
###########################

[ -f $ZSHRC_DIR/configs/local.zshrc ] && source $ZSHRC_DIR/configs/local.zshrc

