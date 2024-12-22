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

# Local config that needs to be included early.
[ -f $ZSHRC_DIR/configs/local-init.zshrc ] && source $ZSHRC_DIR/configs/local-init.zshrc

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
if [ -d "$HOME/dev/flutter" ]; then
    MY_PATH="$MY_PATH:$HOME/dev/flutter/bin"
fi
if [ -d /opt/homebrew ]; then
    MY_PATH="$MY_PATH:/opt/homebrew/opt/mysql-client/bin:/opt/homebrew/opt/ruby/bin"
fi
if [ -d "$HOME/.local/share/nvim/mason/bin" ]; then
    MY_PATH="$MY_PATH:$HOME/.local/share/nvim/mason/bin"
fi
export PATH="$MY_PATH:$PATH"

#########
# Apps #
#######

export LESS='XRi'
export RIPGREP_CONFIG_PATH=$ZSHRC_DIR/../ripgreprc
export GIT_OPTIONAL_LOCKS=0
export GOPATH=~/.local/bin/go
[ -z $KITTY_LISTEN_ON ] &&
    export KITTY_LISTEN_ON=unix:/tmp/kitty-remote-control-$PPID
which chromium >> /dev/null &&
    export CHROME_EXECUTABLE=$(which chromium)

source $ZSHRC_DIR/configs/fnm.zshrc
source $ZSHRC_DIR/configs/fzf.zshrc
source $ZSHRC_DIR/configs/atuin.zshrc

# Haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

############
# Aliases #
##########

source $ZSHRC_DIR/aliases.zshrc

[ -f $ZSHRC_DIR/aliases/local.zshrc ] && source $ZSHRC_DIR/aliases/local.zshrc

#############################
# Local (see also Aliases) #
###########################

[ -f $ZSHRC_DIR/configs/local.zshrc ] && source $ZSHRC_DIR/configs/local.zshrc
