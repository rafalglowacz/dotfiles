if status is-interactive
    fish_add_path -P ~/.cargo/bin
    fish_add_path -P ~/.composer/vendor/bin
    fish_add_path -P ~/.config/composer/vendor/bin
    fish_add_path -P ~/.local/bin
    fish_add_path -P ~/.local/bin/go/bin
    fish_add_path -P ~/.local/share/nvim/mason/bin
    fish_add_path -P ~/bin
    fish_add_path -P ~/bin2
    fish_add_path -P ~/dev/flutter/bin
    fish_add_path -P /opt/homebrew/opt/mysql-client/bin
    fish_add_path -P /opt/homebrew/opt/ruby/bin

    alias ls='eza --icons --group-directories-first -a --hyperlink'
    alias lh='ls -lh --time-style relative'

    abbr g git
    abbr gs git status
    abbr gcav git commit -av
    abbr gd git d -w HEAD
    abbr gdu git diff -w HEAD

    zoxide init fish | source
end

function fish_postexec --on-event fish_postexec
    echo
end
