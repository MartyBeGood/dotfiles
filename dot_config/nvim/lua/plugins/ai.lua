return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        tools = {
          omp = {
            cmd = { "omp" },
          },
        },
      },
    },
  },
  {
    "coder/claudecode.nvim",
    opts = {
      diff_opts = {
        layout = "unified",
      },
    },
  },
}
