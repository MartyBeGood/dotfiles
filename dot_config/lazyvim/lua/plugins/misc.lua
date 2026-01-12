return {
  -- The rails stuff
  { "slim-template/vim-slim" },
  {
    "tpope/vim-rails",
    dependencies = { "tpope/vim-projectionist" },
  },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      icons = {
        mappings = false,
      },
      spec = {
        { "<leader>t", group = "testing" },
        { "<leader>gx", group = "conflict" },
        { "gl", group = "line" },
      },
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "*",
        "!lazy",
        "!gitcommit",
        "!help",
        "!mason",
        "!neo-tree",
        "!messages",
        "!checkhealth",
      },
      user_default_options = {
        tailwind = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
