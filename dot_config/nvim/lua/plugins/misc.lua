return {
  { "MartyBeGood/martykai.nvim" },
  { "tpope/vim-rails" },
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
  { "slim-template/vim-slim" },

  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+testing" }, -- keybinds in lua/plugins/testing.lua
        ["<leader>gx"] = { name = "+conflict" }, -- keybinds in lua/plugins/git.lua
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
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
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        replace = "gsc",
      },
    },
  },
}
