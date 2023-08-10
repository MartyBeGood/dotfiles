return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = true,
  },

  { 'neovim/nvim-lspconfig', },
  { 'creativenull/efmls-configs-nvim' },
  {
    'onsails/lspkind.nvim',
    config = function() require('lspkind').init({ mode = 'symbol' }) end,
    event = 'VeryLazy',
  },
  { 'folke/neodev.nvim', config = true },
}
