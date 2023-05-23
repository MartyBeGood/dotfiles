local wezterm = require 'wezterm'

local table_merge = function(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

local iosevka = {
  font_size = 15,
  cell_width = 0.88,
  font = wezterm.font('Miosevka Nerd Font'),
}



local settings = {
  send_composed_key_when_right_alt_is_pressed = true,
  send_composed_key_when_left_alt_is_pressed = false,
  use_dead_keys = false,
  use_ime = false,
  color_scheme = 'Google Dark (Gogh)',
  colors = {
    -- Make sure you can read the character at the cursor
    cursor_bg = wezterm.color.get_default_colors().foreground,
    cursor_fg = wezterm.color.get_default_colors().background
  },
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 1,
    bottom = 0,
  },
  underline_position = -4,
  audible_bell = "Disabled",
}

table_merge(settings, iosevka)

return settings
