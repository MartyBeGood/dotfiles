return {
  {
    -- needed for darcula-visible-comments
    "santos-gabriel-dario/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  -- { -- Looks pretty, but is broken
  --   "wtfox/jellybeans.nvim",
  -- },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon",
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
    "navarasu/onedark.nvim",
    opts = {
      style = "warmer",
      diagnostics = {
        darker = false,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      background = {
        dark = "macchiato",
      },
    },
  },
}
