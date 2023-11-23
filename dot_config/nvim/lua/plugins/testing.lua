return {
  {
    "vim-test/vim-test",
    dependencies = {
      'akinsho/toggleterm.nvim',
      'tpope/vim-dispatch'
    },
    config = function()
      vim.g["test#strategy"] = "dispatch"
      vim.g['test#ruby#rspec#options'] = {
        file = '--format documentation'
      }

      local cmdify = require('helpers').cmdify
      require("which-key").register({
        ["<space>"] = {
          t = {
            name = "Tests...",
            f = { cmdify("TestFile"), "Run all in file" },
            l = { cmdify("TestLast"), "Run last" },
            s = { cmdify("TestSuite"), "Run test suite" },
            t = { cmdify("TestNearest"), "Run nearest" },
          }
        }
      })
    end
  }
}
