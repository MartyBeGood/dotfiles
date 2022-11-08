local wezterm = require 'wezterm'
return {
  color_scheme = 'Monokai (base16)',
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  send_composed_key_when_left_alt_is_pressed = true,
  font_size = 14,
  colors = {
    cursor_bg = wezterm.color.get_default_colors().foreground,
    cursor_fg = wezterm.color.get_default_colors().background
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 1,
    bottom = 0,
  }
}
