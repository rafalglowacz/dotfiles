function _git_mb --description 'Expand git mb, including after dt'
    set -l cmd (commandline --tokens-expanded --current-process --cut-at-cursor)
    if test "$cmd[-1]" = mb
        set -e cmd[-1]
    end

    if test "$cmd[-1]" = dt
        echo '(git merge-base origin/develop% HEAD)'
        return 0
    end

    if test (count $cmd) -eq 1
        echo 'merge-base origin/develop% HEAD'
        return 0
    end

    return 1
end
