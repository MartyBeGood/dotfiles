local wezterm = require 'wezterm'

-- see https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets
local firacode_harfbuzz = {
  'zero', -- dotted 0
  'cv01', -- a
  'cv02', -- g
  'cv05', -- i
  'cv26', -- :-
  'cv29', -- less cluttered {}
  'ss01', -- r
  'ss02', -- <= >= with straight equals line
  'ss03', -- alternate &
  'ss06', -- lighter first backslash in \\
  'ss08', -- alternate != and !== ligatures
  'ss09', -- additional ligatures: >>= <<= ||= |=
}

local victor_harfbuzz = {
  'ss02', -- a
}

local italic_font = function(weight)
  return wezterm.font(
    {
      family = 'Space Mono',
      style = 'Italic',
      weight = weight,
      harfbuzz_features = { 'ss01', 'ss03', 'liga=0' }
    }
  )
end

local straight_font = function(weight)
  return wezterm.font(
    {
      family = 'FiraCode Nerd Font',
      weight = weight,
      harfbuzz_features = firacode_harfbuzz
    }

  )
end


return {
  -- Colors
  color_scheme = 'Darcula (base16)',
  colors = {
    -- foreground = darcula_fg,
    background = "#282828",
    foreground = "#d8d8d8",
    cursor_bg = wezterm.color.get_default_colors().foreground,
    cursor_fg = wezterm.color.get_default_colors().background
  },

  -- Behavior
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  -- send_composed_key_when_left_alt_is_pressed = true,
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 1,
    bottom = 0,
  },

  -- Font
  font_size = 14,
  font = straight_font('Regular'),

  font_rules = {
    {
      italic = true,
      intensity = 'Bold',
      font = italic_font('Bold')
    },
    {
      italic = true,
      intensity = 'Half',
      font = italic_font('DemiBold')
    },
    {
      italic = true,
      font = italic_font('Regular')
    },
  },
  cell_width = 0.86, -- for fira code
  underline_position = -4,
  audible_bell = "Disabled",
}
