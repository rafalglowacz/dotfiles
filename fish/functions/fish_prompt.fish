function fish_prompt --description 'Informative prompt'
    set -g __fish_git_prompt_showupstream auto
    set -g __fish_git_prompt_showcolorhints yes

    if functions -q fish_is_root_user; and fish_is_root_user
        printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                         and set_color $fish_color_cwd_root
                                                         or set_color $fish_color_cwd) \
            (prompt_pwd) (set_color normal)
    else
        echo -n (set_color brblack)'🭔'
        echo -n (set_color white -b brblack; set_color --bold)(date "+%H:%M:%S")' │ '
        echo -n (set_color normal)(set_color white -b brblack)(prompt_pwd --full-length-dirs 99)
        echo -n (set_color normal)(set_color brblack)'🭎'(set_color normal)

        # Jobs count pill (yellow) shown only when there are background jobs.
        set -l jobc (count (jobs -p))
        if test $jobc -gt 0
            echo -n ' '(set_color blue)'🭔'(set_color black -b blue)$jobc(set_color normal)(set_color blue)'🭎'(set_color normal)
        end

        echo -n (fish_git_prompt)
        echo
        echo -n (set_color red)' ❯'(set_color yellow)'❯'(set_color green)'❯ '
        set_color normal
    end
end
