return {
  -- The rails stuff
  { "slim-template/vim-slim" },
  {
    "tpope/vim-rails",
    dependencies = { "tpope/vim-projectionist" },
  },

  {
    "HiPhish/jinja.vim",
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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-nightasty",
    },
  },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      exclude_filetypes = {
        "TelescopePrompt",
        "Trouble",
        "lazy",
        "mason",
        "mason-installer",
        "gitcommit",
      },
    },
  },
}
