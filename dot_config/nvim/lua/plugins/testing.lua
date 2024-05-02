return {
  {
    "vim-test/vim-test",
    dependencies = {
      "akinsho/toggleterm.nvim",
    },
    config = function()
      local tt = require("toggleterm")
      vim.g["test#custom_strategies"] = {
        tterm = function(cmd)
          local term_id = 500
          tt.exec(cmd, term_id)
        end,
      }

      vim.g["test#strategy"] = "tterm"
      vim.g["test#ruby#rspec#options"] = {

        file = "--format documentation",
      }
    end,

    keys = {
      { "<leader>tt", "<cmd>TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>tf", "<cmd>TestFile<CR>", desc = "Run all tests in file" },
      { "<leader>tl", "<cmd>TestLast<CR>", desc = "Run last test" },
      { "<leader>ts", "<cmd>TestSuite<CR>", desc = "Run test suite" },
    },
  },
}
