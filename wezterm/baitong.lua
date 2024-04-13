-- Baitong theme, ported from https://github.com/cyphbt/baitong-theme
local module = {}

function module.configure(config)
  config.colors = {
    foreground = '#33ff33',
    background = '#112a2a',

    cursor_bg = '#ff00ff',
    cursor_fg = '#112a2a',
    cursor_border = '#ff00ff',

    selection_fg = '#112a2a',
    selection_bg = '#1AE642',

    ansi = {
      '#000000',
      '#f77272',
      '#33ff33',
      '#1AE642',
      '#68FDFE',
      '#ff66ff',
      '#87CEFA',
      '#dbdbd9',
    },
    brights = {
      '#ffffff',
      '#f77272',
      '#33ff33',
      '#1AE642',
      '#68FDFE',
      '#ff66ff',
      '#68FDFE',
      '#dbdbd9',
    },
    quick_select_label_bg = { AnsiColor = 'Black' },
    quick_select_label_fg = { AnsiColor = 'Yellow' },
    quick_select_match_bg = { Color = '#ffffff' },
    quick_select_match_fg = { Color = '#000000' },
  }
end

return module
