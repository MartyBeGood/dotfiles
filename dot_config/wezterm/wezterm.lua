local wezterm = require 'wezterm'

local extra_colors = {
  bg = '#262627',
  fg = '#ced1d4',
  cursor = '#ff9808',
}


local settings = {
  -- Keyboard-related settings
  send_composed_key_when_right_alt_is_pressed = true,
  send_composed_key_when_left_alt_is_pressed = false,
  use_dead_keys = false,
  use_ime = false,

  -- Might want to bake this into a theme at some point
  color_scheme = 'arctic',
  colors = {
    foreground = extra_colors.fg,
    background = extra_colors.bg,
    cursor_bg = extra_colors.cursor,
    cursor_border = extra_colors.cursor,
    cursor_fg = extra_colors.bg,
  },

  -- UI-related settings
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 1,
    bottom = 0,
  },
  audible_bell = "Disabled",

  -- Font settings
  font_size = 15,
  cell_width = 0.88,
  underline_position = -4,
  font = wezterm.font('Miosevka Nerd Font'),
}

return settings
