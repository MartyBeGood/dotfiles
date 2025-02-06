return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon",
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "warmer",
      diagnostics = {
        darker = false,
      },
    },
  },
  {
    "marko-cerovac/material.nvim",
    opts = {
      contrast = {
        sidebars = true,
        floating_windows = true,
        lsp_virtual_text = true,
      },

      styles = {
        comments = { italic = true },
      },

      high_visibility = {
        darker = true,
      },

      lualine_style = "stealth",
    },
  },
  {
    "polirritmico/monokai-nightasty.nvim",
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
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
    },
  },
  {
    -- needed for darcula-visible-comments
    "santos-gabriel-dario/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
}
