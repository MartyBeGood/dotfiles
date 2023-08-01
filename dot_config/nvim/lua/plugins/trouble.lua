return {
  "folke/trouble.nvim",
  dependencies = {
    'folke/lsp-colors.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    mode = 'document_diagnostics',
    action_keys = {
      cancel = "q",
    }
  },
  event = "LspAttach",
}
