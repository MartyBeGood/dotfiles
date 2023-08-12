return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = true,
  },

  { 'neovim/nvim-lspconfig', },
  {
    'folke/neodev.nvim',
    config = true,
  },
  {
    'onsails/lspkind.nvim',
    config = function() require('lspkind').init({ mode = 'symbol' }) end,
    event = 'VeryLazy',
  },
}
