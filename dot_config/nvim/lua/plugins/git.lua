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
  {
    "tpope/vim-fugitive",
    config = function()
      -- Bare :G opens status full-width in a split instead of fugitive's default; any args/range/count fall through to fugitive's own :G definition.
      vim.cmd([[
        command! -bang -nargs=? -range=-1 -complete=customlist,fugitive#Complete G
          \ if empty(<q-args>) && <count> == -1 && !<bang>0 |
          \   exe '<mods> split' | exe '0Git' |
          \ else |
          \   exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", <q-args>) |
          \ endif
      ]])
    end,
  },
}
