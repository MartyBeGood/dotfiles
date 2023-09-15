return {
  {
    "vim-test/vim-test",
    cond = not vim.g.vscode,
    ft = { 'ruby', 'js', 'ts', 'go' },
    config = function()
      vim.g['test#strategy'] = 'toggleterm'
      vim.g['test#ruby#rspec#options'] = {
        file = '--format documentation',
      }
      vim.g['test#go#runner'] = 'gotest'
    end,
    dependencies = 'akinsho/toggleterm.nvim',
  },

  {
    "nvim-neotest/neotest",
    cond = not vim.g.vscode,
    ft = { 'ruby', 'js', 'ts', 'go' },
    dependencies = {
      'olimorris/neotest-rspec',
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function()
              local local_rspec = "./bin/rspec"
              if vim.fn.executable(local_rspec) == 1 then
                return local_rspec
              else
                return vim.tbl_flatten({ "bundle", "exec", "rspec" })
              end
            end,
          })
        }
      })
    end
  }
}
