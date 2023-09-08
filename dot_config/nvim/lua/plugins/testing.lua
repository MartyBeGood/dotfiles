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
}
