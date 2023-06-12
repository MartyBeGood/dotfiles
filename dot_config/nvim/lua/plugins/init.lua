-- Plugins that don't have enough config to warrant their own file go here
return {
  {
    "lmeijvogel/vim-yaml-helper",
    ft = "yaml",
  },
  {
    'akinsho/toggleterm.nvim',
    config = true,
    cmd = { 'ToggleTerm', 'ToggleTermSendCurrentLine', 'ToggleTermSendVisualLines', 'ToggleTermSendVisualSelection' },
  },
  {
    "vim-test/vim-test",
    ft = 'ruby',
    config = function()
      vim.g['test#strategy'] = 'toggleterm'
      vim.g['test#ruby#rspec#options'] = {
        nearest = '--backtrace',
        file = '--format documentation',
      }
    end,
    dependencies = 'akinsho/toggleterm.nvim',
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
    'slim-template/vim-slim',
    ft = 'slim',
  },
  {
    'tpope/vim-rails',
    ft = { 'ruby', 'slim' },
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
  },
  {
    'marko-cerovac/material.nvim',
    opts = {
      contrast = {
        sidebars = true,
        floating_windows = true,
        cursor_line = true
      },
      plugins = {
        "gitsigns",
        "indent-blankline",
        "nvim-cmp",
        "nvim-tree",
        "telescope",
        "trouble",
        "which-key"
      },
      high_visibility = {
        lighter = true,
        darker = true
      },
    },
    lazy = false,
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
