local telescope = require('telescope')
local trouble = require('trouble.providers.telescope')
local full_border = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
telescope.setup({
  defaults = {
    borderchars = {
      prompt = full_border,
      results = full_border,
      preview = full_border,
    },
    layout = {
      prompt_position = "top"
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = "ivy",
      find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*', '--no-ignore-vcs' }
    },
    git_files = {
      previewer = false,
      theme = "ivy",
    },
    lsp_references = {
      theme = "ivy",
      show_line = true,
      fname_width = 0.5
    }
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
