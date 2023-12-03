local wezterm = require 'wezterm'

local module = {}

function module.localConfig(config)
    config.color_scheme = 'Cyberdyne'
    config.window_decorations = 'RESIZE'
    --local theme = require 'baitong' -- dark theme
    --theme.configure(config) -- dark theme
    config.color_scheme = 'Atelier Lakeside Light (base16)' -- light theme
    -- For light themes different desaturation and dimming works better.
    config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.8 } -- light theme
end

return module
