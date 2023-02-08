vim.opt.background = "dark"
vim.opt.cursorline = true

-- vim.cmd.colorscheme "darcula-solid"

-- require('gruvbox').setup {
--   contrast = "medium",
--   -- transparent_mode = true,
-- }
-- vim.cmd.colorscheme "gruvbox"

-- require('kanagawa').setup({
--   transparent = true
-- })
-- vim.cmd.colorscheme "kanagawa"

require('material').setup({
  contrast = {
    terminal = true,
    sidebars = true,
    floating_windows = true,

  },
  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    -- strings = { [[ bold = true ]] },
    keywords = { --[[ underline = true ]] },
    functions = { --[[ bold = true, undercurl = true ]] },
    variables = {},
    operators = {},
    types = { bold = true },
  },
  plugins = {
    'gitsigns',
    'indent-blankline',
    'nvim-cmp',
    'nvim-tree',
    'nvim-web-devicons',
    'trouble',
    'which-key',
  }
})
vim.g.material_style = 'darker'
vim.cmd.colorscheme 'material'

-- require('ofirkai').setup({})

-- require('onedark').setup {
--   style = 'warmer',
--   transparent = true,
-- }
-- require('onedark').load()
