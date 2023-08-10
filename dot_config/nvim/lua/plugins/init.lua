-- Plugins that don't have enough config to warrant their own file go here
return {
  -- Editing goodness
  {
    'NMAC427/guess-indent.nvim',
    config = true,
  },
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
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      hls = {
        GitComment = 'diffComment'
      }
    }
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },
  { 'tpope/vim-fugitive' },
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

  -- colorschemes
  {
    'briones-gabriel/darcula-solid.nvim',
    dependencies = "rktjmp/lush.nvim",
    event = "VeryLazy" -- required to build the variation I'm using, so this gets loaded anyway.
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

}
