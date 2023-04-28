-- Plugins that don't have enough config to warrant their own file go here
return {
  "slim-template/vim-slim",
  "lmeijvogel/vim-yaml-helper",
  'vim-ruby/vim-ruby',

  "vim-test/vim-test",
  'tpope/vim-sleuth',
  'tpope/vim-rake',
  'tpope/vim-bundler',
  'tpope/vim-fugitive',
  'michaeljsmith/vim-indent-object',
  {
    'tpope/vim-rails',
    dependencies = {
      'tpope/vim-projectionist',
    }
  },
  { "kylechui/nvim-surround", config = true },
  { "numToStr/Comment.nvim",  config = true },
  { 'windwp/nvim-autopairs',  config = true },
  {
    'briones-gabriel/darcula-solid.nvim',
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    config = function()
      vim.cmd 'colorscheme darcula-solid'
    end
  },
  -- {
  --   'marko-cerovac/material.nvim',
  --   lazy = false,
  --   config = function()
  --     vim.g.material_style = 'darker'
  --     require('material').setup({
  --       contrast = {
  --         terminal = true,
  --         sidebars = true
  --       },
  --       plugins = {
  --         "gitsigns",
  --         "indent-blankline",
  --         "nvim-cmp",
  --         "nvim-navic",
  --         "nvim-tree",
  --         "nvim-web-devicons",
  --         "telescope",
  --         "trouble",
  --         "which-key",
  --       },
  --       high_visibility = {
  --         darker = true
  --       }
  --     })
  --     vim.cmd 'colorscheme material'
  --   end
  -- },
  { 'Wansmer/treesj',             config = true },
  { "kazhala/close-buffers.nvim", config = true },
  { "sindrets/winshift.nvim",     config = true },
  { "lewis6991/gitsigns.nvim",    dependencies = "nvim-lua/plenary.nvim", event = "BufWinEnter", config = true },
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function() require('leap').add_default_mappings() end
  }
}
