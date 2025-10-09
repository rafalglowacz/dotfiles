if status is-interactive
    set -gx EDITOR hx
    set -gx LESS XRi
    set -gx GIT_OPTIONAL_LOCKS 0
    set -gx GOPATH ~/.local/bin/go
    set -gx NPM_CONFIG_USERCONFIG "$HOME/.config/npm/npmrc"
    set -gx RIPGREP_CONFIG_PATH "$HOME/dev/dotfiles/ripgreprc"

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

    abbr d docker
    abbr dc docker compose
    abbr --command docker d_c --regex c config
    abbr --command docker d_d --regex d down
    abbr --command docker d_e --regex e exec
    abbr --command docker d_i --regex i image
    abbr --command docker d_j --regex j -- --format json
    abbr --command docker d_l --regex l logs
    abbr --command docker d_ll --regex ll logs -n 0 -f
    abbr --command docker d_n --regex n network
    abbr --command docker d_n --regex r restart
    abbr --command docker d_u --regex u up -d
    abbr --command docker d_v --regex v volume

    abbr bad git bisect bad
    abbr good git bisect good

    abbr g git
    abbr gd git dt HEAD
    abbr gds git dt --staged
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
    abbr --command git g_r --regex r reflog
    abbr --command git g_sh --regex sh show
    abbr --command git g_ss --regex ss stash
    abbr --command git g_ssa --regex ssa stash apply
    abbr --command git g_ssl --regex ssl stash list
    abbr --command git g_sss --regex sss stash show
    abbr --command git g_sss --regex sss stash show
    abbr --command git g_st --regex st status

    abbr - cd -
    abbr fxy fx --yaml
    abbr k kubectl
    abbr --command kubectl k_c --regex c config
    abbr --command kubectl k_e --regex e exec -it
    abbr kssh kitten ssh
    abbr ld lazydocker
    abbr lg lazygit
    abbr --command nest nest_g --regex g generate
    abbr rgp rg --engine pcre2
    abbr t tofu

    abbr yayinstall yay -S
    abbr yayrm yay -Rs
    abbr yaylist yay -Q
    abbr yayinfo yay -Qi

    if test -x /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    end

    thefuck -a wat | source
    zoxide init fish | source

    eval "$(atuin init fish --disable-up-arrow)"
    # Bind down arrow to open search. I'm using inverted mode
    # so it makes more sense this way.
    bind \e\[B _atuin_bind_up

    function fish_postexec --on-event fish_postexec
        echo
    end
end
