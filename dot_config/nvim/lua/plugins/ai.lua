return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cond = true,
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-y>",
          accept_line = "<M-l>",
          next = "<M-n>",
          prev = "<M-p>",
        },
      },
    },
  },
}
