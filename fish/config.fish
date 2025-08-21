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

    set -gx LESS XRi
    set -gx GIT_OPTIONAL_LOCKS 0
    set -gx GOPATH ~/.local/bin/go

    alias ls='eza --icons --group-directories-first -a --hyperlink'
    alias lh='ls -lh --time-style relative'

    abbr d docker
    abbr dc docker compose
    abbr --command docker e exec

    abbr bad git bisect bad
    abbr good git bisect good

    abbr g git
    abbr gd git dt HEAD
    abbr gs git status
    abbr gcav git-commit -a
    abbr gcava git commit -av --amend
    abbr gdu git diff -w HEAD
    abbr gpf git push --force
    abbr grh git reset --hard
    abbr gsh git-difftool-show
    abbr gpuoh git push -u origin HEAD
    abbr --command git a add
    abbr --command git b branch
    abbr --command git c config
    abbr --command git ca commit -a
    abbr --command git cav commit -av
    abbr --command git ci commit
    abbr --command git civ commit -v
    abbr --command git co checkout
    abbr --command git cp cherry-pick
    abbr --command git f fetch
    abbr --command git m merge
    abbr --command git pl pull
    abbr --command git ps push
    abbr --command git sh show
    abbr --command git ss stash
    abbr --command git ssa stash apply
    abbr --command git ssl stash list
    abbr --command git sss stash show
    abbr --command git sss stash show
    abbr --command git st status

    abbr - cd -
    abbr k kubectl
    abbr --command kubectl c config
    abbr --command kubectl e exec -it
    abbr t tofu

    abbr yayinstall yay -S
    abbr yayrm yay -Rs
    abbr yaylist yay -Q
    abbr yayinfo yay -Qi

    if test -x /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    end

    zoxide init fish | source
    eval "$(atuin init fish)"

    function fish_postexec --on-event fish_postexec
        echo
    end
end
