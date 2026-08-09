function fzf_git_branch --description 'Insert a branch selected with fzf'
    command -q git; and command -q fzf; or return

    set -l branch (git branch --format='%(refname:short)' | fzf --height=40% --reverse --border)
    if test -n "$branch"
        commandline --insert "$branch"
    end

    commandline -f repaint
end
