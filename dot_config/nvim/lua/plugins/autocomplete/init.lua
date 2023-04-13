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
    'onsails/lspkind.nvim',
    config = function() require('lspkind').init({ mode = 'symbol' }) end
  },
  {
    'j-hui/fidget.nvim', -- LSP info in bottom right corner
    opts = { text = { spinner = 'dots' } }
  },
}
