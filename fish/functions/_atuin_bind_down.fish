function _atuin_bind_down --description 'Down-arrow counterpart to atuin''s _atuin_bind_up, falling back to down-or-search instead of up-or-search'
    # Fallback to fish's builtin down-or-search if we're in search or paging mode
    if commandline --search-mode; or commandline --paging-mode
        down-or-search
        return
    end

    # Only invoke atuin if we're on the top line of the command
    set -l lineno (commandline --line)

    switch $lineno
        case 1
            _atuin_search --shell-up-key-binding
        case '*'
            down-or-search
    end
end
