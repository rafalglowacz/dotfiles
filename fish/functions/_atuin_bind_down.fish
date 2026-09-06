function _atuin_bind_down --description 'Down-arrow counterpart to atuin\'s _atuin_bind_up, falling back to down-or-search instead of up-or-search'
    # Fallback to fish's builtin down-or-search if we're in search or paging mode
    if commandline --search-mode; or commandline --paging-mode
        down-or-search
        return
    end

    # Only invoke atuin when we can't move further down in the buffer
    # (empty or single-line command, or cursor already on the last line).
    # Checking the first line is the up-arrow heuristic and steals down
    # after moving to the top of a multiline command.
    set -l lineno (commandline --line)
    set -l line_count (commandline | count)

    if test $lineno -ge $line_count
        _atuin_search --shell-up-key-binding
    else
        down-or-search
    end
end
