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
      { "<leader>cS", "<cmd>TSJSplit<CR>", desc = "Split TS node under cursor" },
      { "<leader>cJ", "<cmd>TSJJoin<CR>", desc = "Join TS node into one line" },
      { "<leader>cj", "<cmd>TSJToggle<CR>", desc = "Toggle single/multiline" },
    },
  },
}
