local dark_colors = {
  -- Colors specified in color_overrides.all seem to override the darker colors in latte. Define the shared dark colors here to keep the light/dark mode toggleable
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#9b7bae",
  red = "#c8504d",
  maroon = "#8581bd",
  peach = "#cd7628",
  yellow = "#f6c875",
  green = "#879d65",
  teal = "#00adad",
  sky = "#89dceb",
  blue = "#829dc0",
  sapphire = "#4ca3da",
  lavender = "#b4befe",
}

return {
  "catppuccin/nvim",
  lazy = false,
  config = function(_, opts) require("catppuccin").setup(opts) end,
  opts = {
    background = {
      light = "latte",
      dark = "frappe",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    integrations = {
      window_picker = true,
      diffview = true,
      bufferline = true,
    },
  },
}
