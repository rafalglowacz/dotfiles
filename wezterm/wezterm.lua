local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font

config.font = wezterm.font 'Monofur Nerd Font'
config.font_size = 16
-- Monofur is very condensed, let's stretch it a little
config.line_height = 1.1
config.cell_width = 1.05

-- Color scheme

config.color_scheme = 'Blue Matrix'
config.bold_brightens_ansi_colors = false

-- Cursor

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = 'EaseInOut'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 550

-- Window

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'NONE'

return config
