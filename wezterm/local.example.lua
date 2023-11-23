local wezterm = require 'wezterm'

local module = {}

function module.localConfig(config)
    config.color_scheme = 'Cyberdyne'
    config.window_decorations = 'RESIZE'
end

return module
