# This config's real directory path, even if symlinked.
ZSHRC_DIR=$(dirname $(realpath ${funcsourcetrace[1]%:*}))

source $ZSHRC_DIR/aliases/git.zshrc
source $ZSHRC_DIR/aliases/docker.zshrc
source $ZSHRC_DIR/aliases/misc.zshrc
source $ZSHRC_DIR/aliases/system.zshrc
