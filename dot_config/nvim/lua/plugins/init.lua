-- Plugins that don't have enough config to warrant their own file go here
return {
  -- Editing goodness
  { 'tpope/vim-projectionist' },
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    event = "BufWinEnter",
    config = function() require('leap').add_default_mappings() end
  },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "BufWinEnter",
  },
  {
    'windwp/nvim-autopairs',
    config = true,
    event = "BufWinEnter",
  },
  {
    'michaeljsmith/vim-indent-object',
    event = 'BufWinEnter',
  },
  {
    "numToStr/Comment.nvim",
    config = true,
    event = "BufWinEnter",
  },

  -- buffer/split/window/whatever-management
  {
    "kazhala/close-buffers.nvim",
    config = true,
  },
  {
    "sindrets/winshift.nvim",
    config = true,
  },

  -- language support
  {
    "lmeijvogel/vim-yaml-helper",
    ft = "yaml",
  },

  -- Git
  {
    'tpope/vim-fugitive',
    event = "BufWinEnter",
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufWinEnter",
    config = true,
  },

  -- IDE-like features
  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'ToggleTermSendCurrentLine', 'ToggleTermSendVisualLines', 'ToggleTermSendVisualSelection' },
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return vim.o.lines * 0.3
        elseif term.direction == 'vertical' then
          return math.max(vim.o.columns * 0.4, 25)
        else
          return 20
        end
      end,
    }
  },
  {
    "vim-test/vim-test",
    ft = { 'ruby', 'js', 'ts', 'go' },
    config = function()
      vim.g['test#strategy'] = 'toggleterm'
      vim.g['test#ruby#rspec#options'] = {
        file = '--format documentation',
      }
      vim.g['test#go#runner'] = 'gotest'
    end,
    dependencies = 'akinsho/toggleterm.nvim',
  },

  -- colorschemes
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
    'tpope/vim-sleuth',
    event = "BufReadPre",
  },
}
