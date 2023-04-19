return {
  'github/copilot.vim',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim', -- LSP info in bottom right corner
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
  },
  { 'folke/neodev.nvim' },
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
  },
  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
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
}
