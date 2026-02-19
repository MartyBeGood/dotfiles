return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
  end,
  cond = false, -- I'll use the Lazyvim copilot plugins and sidekick instead
  event = "VeryLazy",
  keys = {
    {
      "<C-J>",
      'copilot#Accept("\\<CR>")',
      mode = "i",
      desc = "Accept Copilot suggestion",
      expr = true,
      replace_keycodes = false,
    },
    { "<C-L>", "<Plug>(copilot-accept-line)", mode = "i", desc = "Accept current line of Copilot suggestion" },
  },
}
