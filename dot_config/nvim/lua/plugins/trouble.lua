return {
  "folke/trouble.nvim",
  dependencies = {
    'folke/lsp-colors.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  cond = not vim.g.vscode,
  opts = {
    mode = 'document_diagnostics',
    action_keys = {
      cancel = "q",
    }
  },
  event = "LspAttach",
}
