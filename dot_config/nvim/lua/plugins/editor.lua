return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
    },
    opts = {
      window = {},
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },

  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    opts = {
      hint = "floating-big-letter",
      show_prompt = false,
    },
  },

  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = "-", -- Recommended to be a single key
      buffer_leader_key = "m", -- Per Buffer Mappings
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      "ivy",
    },
  },
}
