"""Custom tab bar that shows window title in brackets when fullscreen"""

from kitty.fast_data_types import Screen, get_options
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
        title = f"🯙{title}🯛"
    
    # Get the tab bar background color (default background)
    opts = get_options()
    tab_bar_bg = as_rgb(int(opts.background))
    
    # Get colors based on whether tab is active
    if tab.is_active:
        # Active tab colors
        tab_bg = as_rgb(int(draw_data.active_bg))
        tab_fg = as_rgb(int(draw_data.active_fg))
        # Index color (gray #444444 for dark theme, #cccccc for light theme)
        # We'll use a slightly lighter gray for the index
        index_fg = as_rgb(0x00cccccc)
    else:
        # Inactive tab colors
        tab_bg = as_rgb(int(draw_data.inactive_bg))
        tab_fg = as_rgb(int(draw_data.inactive_fg))
        index_fg = tab_fg
    
    # Draw left rounded corner
    # The powerline character is drawn with fg=tab_bg against the tab_bar_bg
    screen.cursor.fg = tab_bg
    screen.cursor.bg = tab_bar_bg
    screen.draw("\ue0b6")  # 
    
    # Switch to tab background for the content
    screen.cursor.bg = tab_bg
    screen.cursor.fg = tab_fg
    screen.draw(" ")
    
    # Draw the index in a lighter gray
    screen.cursor.fg = index_fg
    screen.draw(str(index))
    screen.draw(" ")
    
    # Draw the title in the main foreground color
    screen.cursor.fg = tab_fg
    screen.draw(title)
    screen.draw(" ")
    
    # Draw right rounded corner
    # The powerline character is drawn with fg=tab_bg against the tab_bar_bg
    screen.cursor.fg = tab_bg
    screen.cursor.bg = tab_bar_bg
    screen.draw("\ue0b4")  # 
    
    return screen.cursor.x
