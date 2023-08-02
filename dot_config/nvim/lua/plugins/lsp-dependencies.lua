return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = true,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'j-hui/fidget.nvim',
    },
  },
  { 'creativenull/efmls-configs-nvim' },
  {
    'onsails/lspkind.nvim',
    config = function() require('lspkind').init({ mode = 'symbol' }) end,
    event = 'VeryLazy',
  },
  {
    'j-hui/fidget.nvim', -- LSP info in bottom right corner
    branch = 'legacy',
    opts = {
      text = { spinner = 'dots' },
      window = { blend = 0 },
    }
  },
  { 'folke/neodev.nvim', config = true },
}
