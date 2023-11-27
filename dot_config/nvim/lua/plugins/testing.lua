return {
  {
    "vim-test/vim-test",
    dependencies = {
      'akinsho/toggleterm.nvim',
    },
    config = function()
      local tt = require('toggleterm')
      vim.g["test#custom_strategies"] = {
        tterm = function(cmd)
          local term_id = 500
          tt.exec(cmd, term_id)
        end
      }

      vim.g["test#strategy"] = "tterm"
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
            p = { cmdify("ToggleTerm 500"), "Toggle test terminal" },
          }
        }
      })
    end
  }
}
