return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim', -- LSP info in bottom right corner
    },
  },
  { 'folke/neodev.nvim' },
  {
  },
  {
    'j-hui/fidget.nvim',     -- LSP info in bottom right corner
    opts = {
      text = {
        spinner = 'dots'
      }
    }
  },
}
