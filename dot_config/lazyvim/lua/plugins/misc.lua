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
        { "<leader>t",  group = "testing" },
        { "<leader>gx", group = "conflict" },
        { "gl",         group = "line" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-nightasty",
    },
  },
}
