import re
import sys

def mark(text, args, Mark, extra_cli_args, *a):
    """
    Find all lines and mark them for selection.
    The marked text will have leading and trailing whitespace trimmed.
    """
    # Match lines similar to the default line type behavior
    # The regex matches from start of line, captures content, and goes to end of line
    match_count = 0
    for idx, m in enumerate(re.finditer(r'(?m)^\s*(.+?)\s*$', text)):
        start, end = m.span()
        mark_text = text[start:end].replace('\n', '').replace('\0', '').strip()
        if mark_text:
            match_count += 1
            yield Mark(idx, start, end, mark_text, {})

def handle_result(args, data, target_window_id, boss, extra_cli_args, *a):
    """
    Handle the selected line(s) - either paste to terminal or copy to clipboard.
    The program argument determines the action:
    - '-' means paste into terminal
    - '@' means copy to clipboard
    """
    matches, groupdicts = [], []
    for m, g in zip(data['match'], data['groupdicts']):
        if m:
            matches.append(m), groupdicts.append(g)
    
    # Join multiple selections if any
    text = '\n'.join(matches) if len(matches) > 1 else (matches[0] if matches else '')
    
    if not text:
        return
    
    # Get the program from data dictionary - it's in data['programs']
    programs = data.get('programs', [])
    
    # Check if the first program argument is '-' (paste) or '@' (copy to clipboard)
    if programs and len(programs) > 0:
        action = programs[0]
        if action == '-':
            # Paste into terminal
            w = boss.window_id_map.get(target_window_id)
            if w is not None:
                w.paste_text(text)
        elif action == '@':
            # Copy to clipboard
            from kitty.clipboard import set_clipboard_string
            set_clipboard_string(text)
        else:
            # For any other program, let kitty handle it normally
            from kitty.actions import default_hint_action
            default_hint_action(boss, target_window_id, text, args, data)

