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

  -- {
  --   "navarasu/onedark.nvim", -- Iconic atom theme. Toggling dark-> light works, then gets stuck in light mode.
  --   opts = {
  --     -- style = "warmer",
  --     diagnostics = {
  --       darker = false,
  --     },
  --   },
  -- },

  -- {
  --   "marko-cerovac/material.nvim", -- Material theme. Toggling doesn't work right.
  --   opts = {
  --     lualine_style = "stealth", -- 'default', 'stealth'
  --     high_visibility = {
  --       darker = true,
  --       lighter = true,
  --     },
  --   },
  -- },

  {
    "EdenEast/nightfox.nvim", -- Collection of nice-looking themes, but doesn't support background toggling.
    opts = {},
  },

  -- Niche themes I like or try. Might not always look good in all plugins

  {
    -- needed for darcula-visible-comments
    "santos-gabriel-dario/darcula-solid.nvim", -- Darcula from JetBrains. Not much plugin support, familiar looks. No light variant. background change breaks it.
    dependencies = { "rktjmp/lush.nvim" },
  },

  {
    "WTFox/jellybeans.nvim", -- Testing this one. neutral grey, a bit dark, good contrast.
  },

  -- {
  --   "nyoom-engineering/oxocarbon.nvim", -- Light mode seems.. harsh.
  --   -- no options, no setup.
  -- },

  {
    "olimorris/onedarkpro.nvim", -- A more colorful variant of onedark, with a light mode that doesn't get toggled by the background option.
    opts = {},
  },

  -- {
  --   "rebelot/kanagawa.nvim", -- If gruvbox and catppuccin had a baby. Bluish. The 'dragon' variant is too dark-on-dark.
  --   opts = {
  --     theme = "dragon",
  --   },
  -- },

  {
    "ellisonleao/gruvbox.nvim", -- The classic.
    opts = {},
  },

  {
    "polirritmico/monokai-nightasty.nvim", -- It's Monokai.
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
