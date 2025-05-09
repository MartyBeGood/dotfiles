return {
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#strategy"] = "neovim_sticky"
      vim.g["test#ruby#rspec#options"] = {
        file = "--format documentation",
      }
    end,

    keys = {
      { "<leader>t", name = "+testing" },
      { "<leader>tt", "<cmd>TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>tf", "<cmd>TestFile<CR>", desc = "Run all tests in file" },
      { "<leader>tl", "<cmd>TestLast<CR>", desc = "Run last test" },
      { "<leader>ts", "<cmd>TestSuite<CR>", desc = "Run test suite" },
    },
  },
}
