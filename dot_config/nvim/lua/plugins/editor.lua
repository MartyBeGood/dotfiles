return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
    },
    opts = {
      window = {
        position = "right",
      },
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
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
}
