local cmdify = require('helpers').cmdify

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
    "sindrets/winshift.nvim",
    config = function()
      require('which-key').register({
        ["<space>"] = {
          w = {
            name = "Window...",
            w = { cmdify("WinShift"), "Enter move mode" },
            s = { cmdify("WinShift swap"), "Swap current window with..." },
            h = { cmdify("WinShift left"), "Move current window left" },
            j = { cmdify("WinShift down"), "Move current window down" },
            k = { cmdify("WinShift up"), "Move current window up" },
            l = { cmdify("WinShift right"), "Move current window right" },
            H = { cmdify("WinShift far_left"), "Move current window all the way left" },
            J = { cmdify("WinShift far_down"), "Move current window all the way down" },
            K = { cmdify("WinShift far_up"), "Move current window all the way up" },
            L = { cmdify("WinShift far_right"), "Move current window all the way right" },
          }
        }
      })
    end
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
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
    }
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = function()
      require('git-conflict').setup({})

      require('which-key').register({
        ["<space>"] = {
          g = {
            c = {
              name = "Conflict...",
              o = { "<Plug>(git-conflict-ours)", "Choose ours" },
              t = { "<Plug>(git-conflict-theirs)", "Choose theirs" },
              b = { "<Plug>(git-conflict-both)", "Choose both" },
              ["0"] = { "<Plug>(git-conflict-none)", "Choose none" },
              n = { "<Plug>(git-conflict-next-conflict)", "Go to next conflict" },
              p = { "<Plug>(git-conflict-prev-conflict)", "Go to prev conflict" },
            },
          },
        },
      })
    end,
  },
  { 'tpope/vim-fugitive' },

  -- IDE-like features
  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'ToggleTermSendCurrentLine', 'ToggleTermSendVisualLines', 'ToggleTermSendVisualSelection' },
    config = function()
      require('toggleterm').setup({
        size = function(term)
          if term.direction == 'horizontal' then
            return vim.o.lines * 0.3
          elseif term.direction == 'vertical' then
            return math.max(vim.o.columns * 0.4, 25)
          else
            return 20
          end
        end,
      })
      require('which-key').register({
        ["<space>"] = {
          o = {
            T = { cmdify('exe v:count1 . "ToggleTerm"'), 'Toggle terminal #<count>' },
            t = { cmdify('ToggleTerm'), 'Toggle all terminals' }
          }
        }
      })
    end
  },

  -- colorschemes
  {
    'briones-gabriel/darcula-solid.nvim',
    dependencies = "rktjmp/lush.nvim",
    event = "VeryLazy" -- required to build the variation I'm using, so this gets loaded anyway.
  },
  {
    'polirritmico/monokai-nightasty.nvim',
    lazy = false,
    opts = {
      dark_style_background = "dark",
      light_style_background = "default", -- or 'dark', 'transparent', #'RRGGBB'
      hl_styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        floats = "default",   -- 'default', 'dark', 'transparent'
        sidebars = "default", -- 'default', 'dark', 'transparent'
      }
    },
    config = function(_, opts)
      require('monokai-nightasty').load(opts)
    end
  },
}
