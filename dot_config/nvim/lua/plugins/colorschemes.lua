return {
  -- Popular (> 1k stars) colorschemes with good plugin support.
  {
    "folke/tokyonight.nvim", -- Lazyvim default. Bluish, some hard-to-read combinations in the statusline
    opts = {
      style = "storm",
    },
  },

  {
    "catppuccin/nvim", -- Has themes for everything. More readable than tokyonight, much the same vibe.
    name = "catppuccin",
    opts = {
      background = {
        dark = "macchiato",
      },
    },
  },

  {
    "marko-cerovac/material.nvim", -- Material theme. Toggling doesn't work right.
    opts = {
      lualine_style = "stealth", -- 'default', 'stealth'
      high_visibility = {
        darker = true,
        lighter = true,
      },
    },
  },

  {
    "EdenEast/nightfox.nvim", -- Collection of nice-looking themes, but doesn't support background toggling.
    opts = {},
  },

  {
    "projekt0n/github-nvim-theme", -- GitHub theme. Light mode is a bit harsh, dark mode is nice.
    main = "github-theme",
    opts = {
      styles = {
        comments = "italic",
      },
    },
  },

  -- Niche themes I like or try. Might not always look good in all plugins

  {
    -- needed for darcula-visible-comments
    "santos-gabriel-dario/darcula-solid.nvim", -- Darcula from JetBrains. Not much plugin support, familiar looks. No light variant. background change breaks it.
    dependencies = { "rktjmp/lush.nvim" },
  },

  {
    "olimorris/onedarkpro.nvim", -- A more colorful variant of onedark, with a light mode that doesn't get toggled by the background option.
    opts = {},
  },

  {
    "polirritmico/monokai-nightasty.nvim", -- Monokai with a neutral grey background.
    opts = {
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
