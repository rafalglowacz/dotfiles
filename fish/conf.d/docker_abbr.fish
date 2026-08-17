function _docker_abbr --description 'Expand docker subcommands, including after compose'
    set -l token $argv[1]
    set -l cmd (commandline --tokens-expanded --current-process --cut-at-cursor)
    if test "$cmd[-1]" = "$token"
        set -e cmd[-1]
    end

    if test "$token" = j
        echo -- --format json
        return 0
    end

    set -l compose 0
    if test "$cmd[-1]" = compose
        set compose 1
    else if test (count $cmd) -ne 1
        return 1
    end

    if test $compose -eq 1
        switch $token
            case c
                echo config
            case d
                echo down
            case e
                echo exec
            case l
                echo logs
            case ll
                echo logs -n 0 -f
            case r
                echo restart
            case u
                echo up -d
            case '*'
                return 1
        end
        return 0
    end

    switch $token
        case c
            echo config
        case e
            echo exec -it
        case i
            echo image
        case l
            echo logs
        case ll
            echo logs -n 0 -f
        case n
            echo network
        case r
            echo restart
        case v
            echo volume
        case '*'
            return 1
    end
end
