function _de_abbr --description 'Expand de to a directory-aware docker exec'
    set -l dir (path basename $PWD)
    set -l container
    set -l params

    # For custom config, copy the switch below to $custom and change to your
    # needs. It can set $container and $params based on $dir.
    set -l custom ~/.config/de-config.fish
    if test -f $custom
        source $custom
    else
        switch $dir
            case drupal
                set container laradock-workspace-1
                set params -u laradock -w /var/www/drupal
            case laradock laravel
                set container laradock-workspace-1
                set params -u laradock -w /var/www/laravel
            case symfony
                set container laradock-workspace-1
                set params -u laradock -w /var/www/symfony
            case '*'
                set container web
        end
    end

    echo docker exec -it $params $container
end

abbr --add de --position command --function _de_abbr
