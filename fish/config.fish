if status is-interactive
    set -l config_dir (path dirname (path resolve (status filename)))

    set -gx COMPOSER_HOME "$HOME/.config/composer"
    set -gx DOCKER_CLI_HINTS false
    set -gx EDITOR hx
    set -gx VISUAL $EDITOR
    set -gx LESS XRi
    set -gx MOAR '--no-clear-on-exit --quit-if-one-screen'
    set -gx GIT_OPTIONAL_LOCKS 0
    set -gx GOPATH ~/.local/bin/go
    set -gx NPM_CONFIG_USERCONFIG "$HOME/.config/npm/npmrc"
    set -gx RIPGREP_CONFIG_PATH (path normalize "$config_dir/../ripgreprc")
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

    if not set -q KITTY_LISTEN_ON
        set -gx KITTY_LISTEN_ON "unix:/tmp/kitty-remote-control-$fish_pid"
    end

    if command -q chromium
        set -gx CHROME_EXECUTABLE (command -s chromium)
    end

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
    if test -d ~/.atuin/bin
        fish_add_path -P ~/.atuin/bin
    end
    if test -d ~/dev/lib/phpactor/bin
        fish_add_path -P ~/dev/lib/phpactor/bin
    end
    if test -d ~/.local/share/JetBrains/Toolbox/apps/phpstorm/bin
        fish_add_path ~/.local/share/JetBrains/Toolbox/apps/phpstorm/bin
    end

    alias art='php artisan'
    alias clip=pbcopy
    alias diff='diff --color=always'
    alias h=history
    alias icat='kitten icat'
    alias jq='jq -C'
    alias ls='eza --icons --group-directories-first -a --hyperlink'
    alias lh='ls -lh --time-style relative'
    alias lhiso='lh --time-style long-iso'
    alias l1='ls -1'
    alias phpv='php --version'
    alias rm='rm --interactive=never'

    abbr art php artisan
    abbr b brew
    abbr --command brew b_i --regex i install
    abbr --command brew b_s --regex s search
    abbr --command brew b_up --regex up upgrade
    abbr c composer
    abbr cl claude
    abbr clc claude --continue
    abbr clr claude --resume
    abbr d docker
    abbr dc docker compose
    abbr --add docker_sub --command docker --regex '^(c|d|e|i|j|l|ll|n|r|u|v)$' --function _docker_abbr
    abbr fp flatpak
    abbr p podman
    abbr pc podman compose

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
    abbr --command git g_ca --regex ca commit -av
    abbr --command git g_cav --regex cav commit -av
    abbr --command git g_ci --regex ci commit -v
    abbr --command git g_civ --regex civ commit -v
    abbr --command git g_co --regex co checkout
    abbr --command git g_cp --regex cp cherry-pick
    abbr --command git g_d --regex d diff -w
    abbr --command git g_ds --regex ds diff -w --staged
    abbr --command git g_dsu --regex dsu -- -c core.pager=delta diff -w --staged
    abbr --command git g_du --regex du -- -c core.pager=delta diff -w
    abbr --command git g_dtf --regex dtf -- "-c difftool.kitty.cmd='kitten diff --context 999 \$LOCAL \$REMOTE' difftool --dir-diff"
    abbr --command git g_f --regex f fetch
    abbr --command git g_l --regex l mylog
    abbr --command git g_m --regex m merge
    abbr --command git g_ma --regex ma merge --abort
    abbr --command git g_mb --regex mb merge-base origin/develop HEAD
    abbr --command git g_pl --regex pl pull
    abbr --command git g_ps --regex ps push
    abbr --command git g_psd --regex psd push -d origin
    abbr --command git g_r --regex r reflog
    abbr --command git g_re --regex re remote
    abbr --command git g_rl --regex rl reflog
    abbr --command git g_rs --regex rs restore -SW
    abbr --command git g_rv --regex rv remote -v
    abbr --command git g_sa --regex sa 'stash && git stash apply'
    abbr --command git g_sh --regex sh show
    abbr --command git g_ss --regex ss stash
    abbr --command git g_ssa --regex ssa stash apply
    abbr --command git g_ssl --regex ssl stash list
    abbr --command git g_sss --regex sss stash show
    abbr --command git g_sssa --regex sssa 'stash && git stash apply'
    abbr --command git g_st --regex st status
    abbr --command git g_sw --regex sw switch

    abbr -- - 'cd -'
    abbr fxy fx --yaml
    abbr k kubectl
    abbr --command kubectl k_c --regex c config
    abbr --command kubectl k_d --regex d describe
    abbr --command kubectl k_dd --regex dd describe deploy
    abbr --command kubectl k_dp --regex dp describe pod
    abbr --command kubectl k_e --regex e exec -it
    abbr --command kubectl k_g --regex g get
    abbr --command kubectl k_gd --regex gd get deploy
    abbr --command kubectl k_gp --regex gp get pod
    abbr kssh kitten ssh
    abbr ld lazydocker
    abbr lg lazygit
    abbr --command nest nest_g --regex g generate
    abbr rgp rg --engine pcre2
    abbr storm phpstorm
    abbr tr trash -F

    abbr yayinstall yay -S
    abbr yayrm yay -Rs
    abbr yaylist yay -Q
    abbr yayinfo yay -Qi
    abbr yayup yay -Syu --noconfirm

    if test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv fish | source
    end

    thefuck -a wat | source
    zoxide init fish | source

    set -gx FZF_DEFAULT_OPTS "--color=bw --prompt '  ' --pointer '➜'"
    set -gx FZF_ALT_C_COMMAND 'fd --min-depth 1 --max-depth 3'
    set -gx FZF_ALT_C_OPTS "--preview 'eza --icons --group-directories-first -a --hyperlink -lh --time-style relative --color always {}'"
    if command -q fzf
        fzf --fish | source
        bind \e- fzf_git_branch
    end

    eval "$(atuin init fish --disable-up-arrow)"
    # Bind down arrow to open search. I'm using inverted mode
    # so it makes more sense this way.
    bind \e\[B _atuin_bind_up

    bind \cp history-prefix-search-backward
    bind \cn history-prefix-search-forward
    bind \ee edit_command_buffer
    bind \el lh_run

    # Starship replaces the custom Fish prompt when available. The existing
    # prompt functions remain a fallback for machines without Starship.
    if command -q starship
        starship init fish | source
    end

    function fish_postexec --on-event fish_postexec
        echo
    end
end
