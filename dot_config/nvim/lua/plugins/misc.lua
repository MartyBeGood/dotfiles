return {
  { "MartyBeGood/martykai.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "martykai",
    },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
      },
      options = {
        border = "both",
        try_as_border = true,
      },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        replace = "gsc",
      },
    },
  },
}
