return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
      },
      completion = {
        list = {
          selection = {
            preselect = false,
          },
        },
        ghost_text = {
          enabled = false,
          show_with_selection = false,
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    -- Remove all keybindings. They're handled in nvim-cmp.
    keys = function()
      return {}
    end,
  },
}
