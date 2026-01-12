return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "akinsho/git-conflict.nvim",
    keys = {
      { "<leader>gx", name = "+conflict" },
      { "<leader>gxo", "<Plug>(git-conflict-ours)", desc = "Resolve with ours" },
      { "<leader>gxt", "<Plug>(git-conflict-theirs)", desc = "Resolve with theirs" },
      { "<leader>gxb", "<Plug>(git-conflict-both)", desc = "Resolve with both" },
      { "<leader>gx0", "<Plug>(git-conflict-none)", desc = "Resolve with none" },
      { "<leader>gxn", "<Plug>(git-conflict-next-conflict)", desc = "Go to next conflict" },
      { "<leader>gxp", "<Plug>(git-conflict-prev-conflict)", desc = "Go to prev conflict" },
    },
  },
  { "tpope/vim-fugitive" },
}
