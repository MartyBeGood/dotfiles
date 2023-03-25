-- Plugins that don't have enough config to warrant their own file go here
return {
  "folke/which-key.nvim",
  'michaeljsmith/vim-indent-object',
  "slim-template/vim-slim",
  "lmeijvogel/vim-yaml-helper",
  "vim-test/vim-test",
  'tpope/vim-sleuth',
  'tpope/vim-rails',
  'tpope/vim-rake',
  'tpope/vim-bundler',
  'tpope/vim-projectionist',
  'tpope/vim-fugitive',
  { "kylechui/nvim-surround",             config = true },
  { "numToStr/Comment.nvim",              config = true },
  { 'windwp/nvim-autopairs',              config = true },
  { 'briones-gabriel/darcula-solid.nvim', dependencies = "rktjmp/lush.nvim",      lazy = false },
  { 'Wansmer/treesj',                     config = true },
  { "kazhala/close-buffers.nvim",         config = true },
  { "sindrets/winshift.nvim",             config = true },
  { "luukvbaal/stabilize.nvim",           config = true },
  { "lewis6991/gitsigns.nvim",            dependencies = "nvim-lua/plenary.nvim", event = "BufWinEnter", config = true },
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function() require('leap').add_default_mappings() end
  }
}
