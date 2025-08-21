function fish_right_prompt
    if test $CMD_DURATION != "0"
        # Show duration of the last command in seconds
        set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.2fs", $1 / $2}')
        echo $duration
    end
end
