vim.opt.background = "dark"
vim.opt.cursorline = true

-- require('onedark').setup {
--   style = 'warmer',
--   transparent = true,
-- }
-- require('onedark').load()

require('gruvbox').setup {
  contrast = "medium",
  -- transparent_mode = true,
}

vim.cmd.colorscheme "gruvbox"
-- vim.cmd.colorscheme "darcula-solid"

-- require('ofirkai').setup({})
