-- Plugins that don't have enough config to warrant their own file go here
return {
  -- Editing goodness
  {
    'NMAC427/guess-indent.nvim',
    config = true,
  },
  { 'tpope/vim-projectionist' },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "BufWinEnter",
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    'michaeljsmith/vim-indent-object',
    event = 'BufWinEnter',
  },
  {
    "sindrets/winshift.nvim",
    cond = not vim.g.vscode,
    config = true,
  },

  -- language support
  {
    "lmeijvogel/vim-yaml-helper",
    cond = not vim.g.vscode,
    ft = "yaml",
  },

  -- Git
  {
    'sindrets/diffview.nvim',
    cond = not vim.g.vscode,
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
    }
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    cond = not vim.g.vscode,
    config = true,
  },
  { 'tpope/vim-fugitive' },

  -- IDE-like features
  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'ToggleTermSendCurrentLine', 'ToggleTermSendVisualLines', 'ToggleTermSendVisualSelection' },
    cond = not vim.g.vscode,
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
    cond = not vim.g.vscode,
    dependencies = "rktjmp/lush.nvim",
    event = "VeryLazy" -- required to build the variation I'm using, so this gets loaded anyway.
  },
  {
    'ofirgall/ofirkai.nvim',
    cond = not vim.g.vscode,
  },
  {
    'marko-cerovac/material.nvim',
    cond = not vim.g.vscode,
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
