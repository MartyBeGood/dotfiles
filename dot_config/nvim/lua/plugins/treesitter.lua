return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = {
      ensure_installed = { "lua", "vimdoc" },
      indent = { disable = { "ruby" } },
      highlight = { enable = true },
      endwise = { enable = true },
    },
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cond = not vim.g.vscode,
    opts = {
      use_default_keymaps = false,
      check_syntax_error = true,
      max_join_length = 1000,
    },
    keys = {
      { "<leader>cs", "<cmd>TSJSplit<CR>",  desc = "Multiline token" },
      { "<leader>cj", "<cmd>TSJJoin<CR>",   desc = "Single-line token" },
      { "<leader>cm", "<cmd>TSJToggle<CR>", desc = "Toggle token single/multiline" },
    },
  }
}
