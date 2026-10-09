function _de_abbr --description 'Expand de to a directory-aware docker exec'
    set -l dir (path basename $PWD)
    set -l container
    set -l params
    set -l compose false

    # For custom config, copy the switch below to $custom and change to your
    # needs.
    set -l custom ~/.config/de-config.fish
    if test -f $custom
        source $custom
    else
        switch $dir
            case drupal
                set container workspace
                set params -u laradock -w /var/www/drupal
                set compose true
            case laradock laravel
                set container workspace
                set params -u laradock -w /var/www/laravel
                set compose true
            case symfony
                set container workspace
                set params -u laradock -w /var/www/symfony
                set compose true
            case '*'
                set container web
        end
    end

    if test "$compose" = true
        echo docker compose exec $params $container
    else
        echo docker exec -it $params $container
    end
end

abbr --add de --position command --function _de_abbr
