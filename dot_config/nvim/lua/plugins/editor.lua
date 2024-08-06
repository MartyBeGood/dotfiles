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
  }
}
