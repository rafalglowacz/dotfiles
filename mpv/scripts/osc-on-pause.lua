function on_pause_change(name, value)
    if value == true then
        mp.command("script-message osc-visibility " .. ("always"))
    else
        mp.command("script-message osc-visibility " .. ("auto"))
    end
end
mp.observe_property("pause", "bool", on_pause_change)
