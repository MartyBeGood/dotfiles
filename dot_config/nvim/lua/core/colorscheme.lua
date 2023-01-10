vim.opt.background = "dark"
vim.opt.cursorline = true

-- require('onedark').setup {
--   style = 'warmer',
--   transparent = true,
-- }
-- require('onedark').load()

require('gruvbox').setup {
  contrast = "hard"
}

vim.cmd.colorscheme "gruvbox"

-- vim.cmd [[colorscheme minimal]]

-- require('ofirkai').setup({})
