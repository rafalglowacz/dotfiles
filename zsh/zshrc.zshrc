# This config's real directory path, even if symlinked.
ZSHRC_DIR=$(dirname $(realpath ${funcsourcetrace[1]%:*}))

############
# General #
##########

WORDCHARS='*?_-[]~=;.!@#$%^&(){}<>/\|'
ZLE_REMOVE_SUFFIX_CHARS=""
ZSH_THEME="candy"
# See also omz-termsupport-preexec-custom.zshrc
ZSH_THEME_TERM_TITLE_IDLE="%~"
setopt GLOB_DOTS
source $ZSHRC_DIR/configs/precmd.zshrc

############
# History #
##########

HISTSIZE=11000
SAVEHIST=10000
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

##############
# Oh My ZSH #
############

export ZSH="$HOME/.oh-my-zsh"

plugins=(
	colored-man-pages
	command-time
	copybuffer
	extract
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $ZSHRC_DIR/configs/plugins.zshrc
source $ZSHRC_DIR/configs/omz-termsupport-preexec.zshrc

########################
# Oh My ZSH overrides #
######################

source $ZSHRC_DIR/configs/prompt.zshrc

#########
# Apps #
#######

export LESS='XRi'
export RIPGREP_CONFIG_PATH=$ZSHRC_DIR/../ripgreprc
export GIT_OPTIONAL_LOCKS=0
export GOPATH=~/.local/bin/go

source $ZSHRC_DIR/configs/fzf.zshrc
source $ZSHRC_DIR/configs/nvm.zshrc

# Haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

##################
# Custom config #
################

which pbcopy > /dev/null && COPY_CMD=pbcopy || COPY_CMD=wl-copy

############
# Aliases #
##########

source $ZSHRC_DIR/aliases/git.zshrc
source $ZSHRC_DIR/aliases/docker.zshrc
source $ZSHRC_DIR/aliases/misc.zshrc

[ -f $ZSHRC_DIR/aliases/local.zshrc ] && source $ZSHRC_DIR/aliases/local.zshrc

#############################
# Local (see also Aliases) #
###########################

[ -f $ZSHRC_DIR/configs/local.zshrc ] && source $ZSHRC_DIR/configs/local.zshrc
