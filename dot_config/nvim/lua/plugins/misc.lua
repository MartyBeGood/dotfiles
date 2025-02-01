return {
  -- The rails stuff
  { "tpope/vim-rails" },
  { "slim-template/vim-slim" },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      icons = {
        mappings = false,
      },
      spec = {
        ["<leader>t"] = { name = "+testing" }, -- keybinds in lua/plugins/testing.lua
        ["<leader>gx"] = { name = "+conflict" }, -- keybinds in lua/plugins/git.lua
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
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
