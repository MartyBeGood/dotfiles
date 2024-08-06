return {
  {
    "folke/flash.nvim",
    keys = {
      -- these would conflict with surround.nvim, and I don't use them anyway
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "o", "x" }, false }
    }
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn"
      }
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      's1n7ax/nvim-window-picker',
    },
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          visible = true
        }
      }
    },
  },

  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    opts = {
      hint = 'floating-big-letter',
      show_prompt = false,

    }
  }
}
