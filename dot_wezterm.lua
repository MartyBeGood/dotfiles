local wezterm = require 'wezterm'

-- see https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets
local firacode_harfbuzz = {
  'zero', -- dotted 0
  'cv01', -- a
  'cv02', -- g
  'cv26', -- :-
  'cv29', -- less cluttered {}
  'ss01', -- r
  'ss02', -- <= >= with straight equals line
  'ss03', -- alternate &
  'ss06', -- lighter first backslash in \\
  'ss07', -- !~ and =~ ligatures
  'ss08', -- alternate != and !== ligatures
  'ss09', -- additional ligatures: >>= <<= ||= |=
}

local firacode_nerd_font = {
  family = 'FiraCode Nerd Font',
  harfbuzz_features = firacode_harfbuzz,
}

return {
  color_scheme = 'MonokaiDark (Gogh)',
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  send_composed_key_when_left_alt_is_pressed = true,
  adjust_window_size_when_changing_font_size = false,

  font_size = 14,
  font = wezterm.font_with_fallback {
    firacode_nerd_font,
    'JetBrainsMono Nerd Font',
    'JetBrains Mono'
  },
  harfbuzz_features = firacode_harfbuzz,
  font_rules = {
    {
      italic = true,
      font = wezterm.font({ family = "JetBrainsMono Nerd Font", style = "Italic" })
    }
  },
  cell_width = 0.8, -- for fira code
  -- line_height = 0.95, -- for jetbrains mono
  underline_position = -3,
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
