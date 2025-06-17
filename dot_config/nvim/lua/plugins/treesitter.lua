return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    opts = {
      indent = {
        disable = { "ruby" }, -- Treesitter dedents when you enter a . in a method (since something.end may be a method)
      },
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
      { "gl", group = "line" },
      { "gls", "<cmd>TSJSplit<CR>", desc = "Split TS node under cursor" },
      { "glj", "<cmd>TSJJoin<CR>", desc = "Join TS node into one line" },
      { "gll", "<cmd>TSJToggle<CR>", desc = "Toggle single/multiline" },
    },
  },
}
