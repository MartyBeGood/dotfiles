return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    opts = {
      endwise = {
        enable = true,
      },
    },
  },
  {
    "Wansmer/treesj",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      use_default_keymaps = false,
      check_syntax_error = true,
      max_join_length = 1000, -- default: 120.
    },
    keys = {
      { "<leader>gS", "<cmd>TSJSplit<CR>", "Split TS node under cursor" },
      { "<leader>gJ", "<cmd>TSJJoin<CR>", "Join TS node into one line" },
      { "gS", "<cmd>TSJToggle<CR>", "Toggle single/multiline" },
    },
  },
}
