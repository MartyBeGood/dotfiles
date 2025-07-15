local make_colorschemes = function()
  vim.g.dark_theme = "github_dark"
  vim.g.light_theme = "github_light"

  if vim.o.bg == "dark" then
    return vim.g.dark_theme
  else
    return vim.g.light_theme
  end
end
return {
  -- The rails stuff
  { "slim-template/vim-slim" },
  {
    "tpope/vim-rails",
    dependencies = { "tpope/vim-projectionist" },
  },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      icons = {
        mappings = false,
      },
      spec = {
        { "<leader>t", group = "testing" },
        { "<leader>gx", group = "conflict" },
        { "gl", group = "line" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = make_colorschemes(),
    },
  },
}
