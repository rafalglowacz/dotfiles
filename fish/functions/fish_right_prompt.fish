function fish_right_prompt
    # Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color black -b $fish_color_status --bold)
    set -l pipestatus_string (__fish_print_pipestatus " " "" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -n $pipestatus_string

    if test $CMD_DURATION != 0
        # Show duration of the last command in seconds
        set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.2fs", $1 / $2}')
        echo " $duration"
    end
end
