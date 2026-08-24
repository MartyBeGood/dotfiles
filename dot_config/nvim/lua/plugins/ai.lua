local function preferred_tui()
  local val = vim.fn.getenv("NVIM_PREFER_CLAUDE")
  if val == vim.NIL or val == "" or val == "0" or val == "false" or val == "no" then return "opencode" end
  return "claude"
end

return {
  {
    "folke/sidekick.nvim",
    keys = {
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle({ name = preferred_tui() }) end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<M-.>",
        function() require("sidekick.cli").focus({ name = preferred_tui() }) end,
        desc = "Sidekick Focus",
        mode = { "n", "t", "i", "x" },
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
