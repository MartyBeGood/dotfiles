local telescope = require('telescope')
telescope.setup({
  defaults = {
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { " " },
    }
  },
  pickers = {
    find_files = {
      previewer = false,
      find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*', '--no-ignore-vcs' }
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
