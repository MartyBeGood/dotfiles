return {
  { "tpope/vim-fugitive", cond = not vim.g.vscode },
  {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    opts = {
      current_line_blame = true
    }
  }
}
