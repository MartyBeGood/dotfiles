local themes = require("telescope.themes")
local telescope = require('telescope')
telescope.setup({
  defaults = themes.get_ivy {},
  pickers = {
    find_files = {
      previewer = false,
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      mappings = {
      }
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
