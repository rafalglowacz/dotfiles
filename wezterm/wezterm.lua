local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Font

config.font = wezterm.font 'Monofur Nerd Font'
config.font_size = 16
-- Monofur is very condensed, let's stretch it a little
config.line_height = 1.2
config.cell_width = 1.1

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
config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = true
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5,
}

-- Quick select

config.disable_default_quick_select_patterns = true
config.quick_select_patterns = {
    '[\\w./-]{5,}+'
}

-- Startup

config.default_prog = { 'zsh', '-lic', 'nnn -nA' };

-- Shortcuts

config.keys = {
    { key = '"', mods = 'CMD|SHIFT',  action = wezterm.action.SplitHorizontal },
    { key = '"', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal },
    { key = '+', mods = 'CMD|SHIFT',  action = wezterm.action.SplitVertical },
    { key = '+', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical },
    {
        key = 'p',
        mods = 'CTRL|ALT',
        action = act.PaneSelect { mode = 'SwapWithActive' }
    },
    {
        key = "T",
        mods = 'CMD|SHIFT',
        action = act.SpawnTab 'CurrentPaneDomain'
    },
    {
        key = "Space",
        mods = 'CMD|SHIFT',
        action = act.QuickSelect
    },
    {
        key = "X",
        mods = 'CMD|SHIFT',
        action = act.ActivateCopyMode
    },
    {
        key = "F",
        mods = 'CMD|SHIFT',
        action = act.Search { CaseSensitiveString = "" }
    },
}

if wezterm.gui then
    copy_mode = wezterm.gui.default_key_tables().copy_mode
    table.insert(copy_mode, { key = 'i', mods = 'NONE', action = act.CopyMode 'MoveUp' })
    table.insert(copy_mode, { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveLeft' })
    table.insert(copy_mode, { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveDown' })
    table.insert(copy_mode, { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' })
    config.key_tables = { copy_mode = copy_mode }
end

-- Include local. 
-- IMPORTANT: note that we're looking at a file -- outside of ~/Dev/dotfiles, 
-- so an extra symlink is necessary.

local fh = io.open(os.getenv( "HOME" ) .. '/.config/wezterm/local.lua', 'r')
if fh ~= nil then
    io.close(fh)
    local custom = require 'local'
    custom.localConfig(config)
end

return config
