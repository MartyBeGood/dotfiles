return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = true,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'j-hui/fidget.nvim', -- LSP info in bottom right corner
    },
  },
  {
    'onsails/lspkind.nvim',
    config = function() require('lspkind').init({ mode = 'symbol' }) end,
  },
  {
    'j-hui/fidget.nvim', -- LSP info in bottom right corner
    opts = { text = { spinner = 'dots' } }
  },
  { 'folke/neodev.nvim', config = true },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim'
    },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.diagnostics.rubocop,
        }
      })
    end
  },
  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    opts = {
      automatic_installation = false,
      automatic_setup = true,
      handlers = {},
    }
  },
}
