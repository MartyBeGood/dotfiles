-- Plugins that don't have enough config to warrant their own file go here
return {
  {
    "lmeijvogel/vim-yaml-helper",
    ft = "yaml",
  },

  {
    "vim-test/vim-test",
    ft = 'ruby',
  },
  {
    'tpope/vim-sleuth',
    event = "BufReadPre",
  },
  {
    'tpope/vim-fugitive',
    event = "BufWinEnter",
  },
  {
    'michaeljsmith/vim-indent-object',
    event = 'BufWinEnter',
  },
  {
    'tpope/vim-rails',
    ft = {'ruby', 'slim'},
    dependencies = {
      'tpope/vim-projectionist',
    }
  },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "BufWinEnter",
  },
  {
    "numToStr/Comment.nvim",
    config = true,
    event = "BufWinEnter",
  },
  {
    'windwp/nvim-autopairs',
    config = true,
    event = "BufWinEnter",
  },
  {
    'briones-gabriel/darcula-solid.nvim',
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    config = function()
      vim.cmd 'colorscheme darcula-solid'
    end
  },
  {
    'Wansmer/treesj',
    config = true,
    event = 'BufWinEnter',
  },
  {
    "kazhala/close-buffers.nvim",
    config = true,
  },
  {
    "sindrets/winshift.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufWinEnter",
    config = true,
  },
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    event = "BufWinEnter",
    config = function() require('leap').add_default_mappings() end
  }
}
