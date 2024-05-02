return {
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
    }
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = function()
      require('git-conflict').setup({})

      require('which-key').register({
        ["<space>"] = {
          g = {
            c = {
              name = "Conflict...",
              o = { "<Plug>(git-conflict-ours)", "Choose ours" },
              t = { "<Plug>(git-conflict-theirs)", "Choose theirs" },
              b = { "<Plug>(git-conflict-both)", "Choose both" },
              ["0"] = { "<Plug>(git-conflict-none)", "Choose none" },
              n = { "<Plug>(git-conflict-next-conflict)", "Go to next conflict" },
              p = { "<Plug>(git-conflict-prev-conflict)", "Go to prev conflict" },
            },
          },
        },
      })
    end,
  },
  { 'tpope/vim-fugitive' },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true
  },
}
