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
  'ss07', -- !~ and =~ ligatures
  'ss08', -- alternate != and !== ligatures
  'ss09', -- additional ligatures: >>= <<= ||= |=
}

local italic_font = function(weight)
  return wezterm.font(
    {
      family = 'CaskaydiaCove Nerd Font',
      italic = true,
      weight = weight,
    }
  )
end

local straight_font = function(weight)
  return wezterm.font(
    {
      family = 'FiraCode Nerd Font',
      weight = weight,
      harfbuzz_features = firacode_harfbuzz,
    }

  )
end

local darcula_fg = 'hsl:210 7 82'

return {
  -- Colors
  color_scheme = 'Monokai (base16)',
  colors = {
    -- foreground = darcula_fg,
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
  font_size = 14.5,
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
      font = italic_font('DemiLight')
    },
  },
  cell_width = 0.85, -- for fira code
  -- line_height = 0.95, -- for jetbrains mono
  underline_position = -4,
}
