function fish_prompt --description 'Informative prompt'
    set -g __fish_git_prompt_showupstream auto
    set -g __fish_git_prompt_showdirtystate yes
    set -g __fish_git_prompt_showcolorhints yes

    # Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    if functions -q fish_is_root_user; and fish_is_root_user
        printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                         and set_color $fish_color_cwd_root
                                                         or set_color $fish_color_cwd) \
            (prompt_pwd) (set_color normal)
    else
        set -l status_color (set_color $fish_color_status)
        set -l statusb_color (set_color --bold $fish_color_status)
        set -l pipestatus_string (__fish_print_pipestatus " [" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

        echo -n (set_color brblack)''
        echo -n (set_color white -b brblack; set_color --bold)(date "+%H:%M:%S")' │ '
        echo -n (set_color normal)(set_color white -b brblack)(prompt_pwd --full-length-dirs 99)
        echo -n (set_color normal)(set_color brblack)''(set_color normal)

        # Jobs count pill (yellow) shown only when there are background jobs.
        set -l jobc (count (jobs -p))
        if test $jobc -gt 0
            echo -n ' '(set_color yellow)''(set_color black -b yellow)$jobc(set_color normal)(set_color yellow)''(set_color normal)
        end

        echo -n $pipestatus_string
        echo -n (fish_git_prompt)
        echo
        echo -n (set_color blue)'➤'(set_color normal)'  '
    end
end
