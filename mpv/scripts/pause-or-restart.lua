mp.add_key_binding(nil, "pause-or-restart", function()
    if mp.get_property_native("eof-reached") then
        mp.commandv("seek", 0, "absolute")
        mp.set_property_native("pause", false)
    else
        mp.command("cycle pause")
    end
end)
