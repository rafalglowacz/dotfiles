local wezterm = require 'wezterm'

local module = {}

function module.localConfig(config)
    config.color_scheme = 'Cyberdyne'
    config.window_decorations = 'RESIZE'
    local theme = require 'baitong'
    theme.configure(config)
end

return module
