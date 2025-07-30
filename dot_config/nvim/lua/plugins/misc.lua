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
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-nightasty",
    },
  },
}
