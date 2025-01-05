if status is-interactive
    fish_add_path ~/.composer/vendor/bin
    fish_add_path ~/.config/composer/vendor/bin
    fish_add_path ~/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.local/bin
    fish_add_path ~/.local/bin/go/bin
    # if [ -d "$HOME/bin2" ]; then
    #     MY_PATH="$MY_PATH:$HOME/bin2"
    # fi
    # if [ -d "$HOME/dev/flutter" ]; then
    #     MY_PATH="$MY_PATH:$HOME/dev/flutter/bin"
    # fi
    # if [ -d /opt/homebrew ]; then
    #     MY_PATH="$MY_PATH:/opt/homebrew/opt/mysql-client/bin:/opt/homebrew/opt/ruby/bin"
    # fi
    # if [ -d "$HOME/.local/share/nvim/mason/bin" ]; then
    #     MY_PATH="$MY_PATH:$HOME/.local/share/nvim/mason/bin"
    # fi
    # export PATH="$MY_PATH:$PATH"

    alias ls='eza --icons --group-directories-first -a --hyperlink'
    alias lh='ls -lh --time-style relative'

    abbr g git
    abbr gs git status
    abbr gcav git commit -av
    abbr gd git d -w HEAD
    abbr gdu git diff -w HEAD

    zoxide init fish | source
end
