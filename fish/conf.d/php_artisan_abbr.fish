function _php_artisan_abbr --description 'Expand php artisan subcommands'
    set -l token $argv[1]
    set -l cmd (commandline --tokens-expanded --current-process --cut-at-cursor)
    if test "$cmd[-1]" = "$token"
        set -e cmd[-1]
    end
    if test "$cmd[-1]" != artisan
        return 1
    end

    switch $token
        case m
            echo migrate
        case mr
            echo migrate:rollback
        case '*'
            return 1
    end
end
