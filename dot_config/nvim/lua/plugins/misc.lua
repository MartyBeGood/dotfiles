return {
  { "MartyBeGood/martykai.nvim" },
  { "tpope/vim-rails" },

  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+testing" }, -- keybinds in lua/plugins/testing.lua
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
    "akinsho/nvim-toggleterm.lua",
    config = true,
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
        try_as_border = true,
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
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {
          mason = false, -- No autoinstall plz
          settings = {
            solargraph = {
              diagnostics = true,
            },
          },
          init_options = {
            formatting = true,
          },
        },
      },
    },
  },
}
