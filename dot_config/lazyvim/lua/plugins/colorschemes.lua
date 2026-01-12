return {
  -- NOTE: to future self: Just leave it as is unless monokai-nightasty is broken. You've tried and failed to find a better one many times.

  -- Themes I've tried and didn't like enough to keep:
  -- "folke/tokyonight.nvim", -- Lazyvim default. Bluish, some hard-to-read combinations in the statusline
  -- "catppuccin/nvim", -- Has themes for everything. More readable than tokyonight, much the same vibe.
  -- "marko-cerovac/material.nvim", -- Material theme. Toggling doesn't work right.
  -- "EdenEast/nightfox.nvim", -- Collection of nice-looking themes, but doesn't support background toggling.
  -- "projekt0n/github-nvim-theme", -- GitHub theme. Light mode is a bit harsh, dark mode is nice.
  {
    "polirritmico/monokai-nightasty.nvim", -- Monokai with a neutral grey background.
    opts = {
      dim_inactive = false,
      dark_style_background = "dark",
      on_colors = function(colors)
        if vim.o.background == "light" then
          colors.blue = "#0043c3"
          colors.green = "#207000"
          colors.magenta = "#d0325c"
          colors.orange = "#cf3000"
          colors.yellow = "#df6f00"
          colors.git.add = "#30a000"
          colors.git.change = "#df6f00"
          colors.git.remove = "cf3000"
        else
          colors.magenta = "#e34481"
        end
      end,
    },
  },
}
