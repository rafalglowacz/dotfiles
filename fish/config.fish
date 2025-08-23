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
    abbr --command docker d_d --regex d down
    abbr --command docker d_e --regex e exec
    abbr --command docker d_u --regex u up -d

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
    abbr --command git g_a --regex a add
    abbr --command git g_b --regex b branch
    abbr --command git g_c --regex c config
    abbr --command git g_ca --regex ca commit -a
    abbr --command git g_cav --regex cav commit -av
    abbr --command git g_ci --regex ci commit
    abbr --command git g_civ --regex civ commit -v
    abbr --command git g_co --regex co checkout
    abbr --command git g_cp --regex cp cherry-pick
    abbr --command git g_f --regex f fetch
    abbr --command git g_m --regex m merge
    abbr --command git g_pl --regex pl pull
    abbr --command git g_ps --regex ps push
    abbr --command git g_sh --regex sh show
    abbr --command git g_ss --regex ss stash
    abbr --command git g_ssa --regex ssa stash apply
    abbr --command git g_ssl --regex ssl stash list
    abbr --command git g_sss --regex sss stash show
    abbr --command git g_sss --regex sss stash show
    abbr --command git g_st --regex st status

    abbr - cd -
    abbr k kubectl
    abbr --command kubectl k_c --regex c config
    abbr --command kubectl k_e --regex e exec -it
    abbr kssh kitten ssh
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
