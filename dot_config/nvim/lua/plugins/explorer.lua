return {
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
      }
    },
    keys = {
      { "<leader>fm", "<cmd>Oil<CR>", desc = "Directory editor here" },
      { "<leader>fM", "<cmd>Oil .<CR>", desc = "Directory editor at cwd" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {},
    event = "VeryLazy",
    keys = {
      { "<leader>fe", "<cmd>NvimTreeToggle<CR>", desc = "Open file tree" },
    },
  },
}
