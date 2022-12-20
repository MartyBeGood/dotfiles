vim.opt.background = "dark"
vim.opt.cursorline = true
vim.g.minimal_transparent_background = 0
require('onedark').setup {
  style = 'darker',
  transparent = true,
}
require('onedark').load()
-- vim.cmd [[colorscheme minimal]]
-- require('ofirkai').setup({})
