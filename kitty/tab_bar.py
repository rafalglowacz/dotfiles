"""Custom tab bar that shows window title in brackets when fullscreen"""

from kitty.fast_data_types import Screen
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    TabBarData,
    as_rgb,
)


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    """Draw a single tab with custom formatting"""
    
    # Get the tab title
    title = tab.title
    
    # Check if the layout is 'stack' (fullscreen mode)
    if tab.layout_name == 'stack':
        # Wrap the title in brackets if in stack/fullscreen layout
        title = f"[{title}]"
    
    # Build the tab text with the same format as your current template:
    # " {fmt.fg._444444}{index}{fmt.fg.default} {title}  "
    
    # Get default colors based on whether tab is active
    if tab.is_active:
        default_bg = as_rgb(int(draw_data.active_bg))
        default_fg = as_rgb(int(draw_data.active_fg))
    else:
        default_bg = as_rgb(int(draw_data.inactive_bg))
        default_fg = as_rgb(int(draw_data.inactive_fg))
    
    # Gray color for index (#444444)
    gray_fg = as_rgb(0x00444444)
    
    # Set colors and draw
    screen.cursor.bg = default_bg
    screen.cursor.fg = default_fg
    
    # Draw the tab content: " {gray_index} {title}  "
    screen.draw(" ")
    
    # Draw index in gray
    screen.cursor.fg = gray_fg
    screen.draw(str(index))
    
    # Reset to default foreground and draw title
    screen.cursor.fg = default_fg
    screen.draw(f" {title}  ")
    
    return screen.cursor.x
