return {
  { "MartyBeGood/martykai.nvim" },

  -- The rails stuff
  { "tpope/vim-rails" },
  { "slim-template/vim-slim" },

  {
    -- needed for darcula-visible-comments
    "santos-gabriel-dario/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
      italic = {
        strings = false,
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        ["<leader>t"] = { name = "+testing" }, -- keybinds in lua/plugins/testing.lua
        ["<leader>gx"] = { name = "+conflict" }, -- keybinds in lua/plugins/git.lua
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "martykai",
    },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
      },
      options = {
        border = "both",
      },
    },
  },
}
