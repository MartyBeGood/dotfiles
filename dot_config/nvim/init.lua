-- local in_vscode = require('helpers/misc').in_vscode

require('packer_init')
pcall (require 'impatient')

require('core/options')
require('core/autocmds')
require('plugin/nvim-surround')
require('plugin/close-buffers')

-- if not in_vscode() then
  require('plugin/colorscheme')
  require('plugin/which-key')
  require('plugin/nvim-treesitter')
  require('plugin/nvim-lspconfig')
  require('plugin/lualine')
  require('plugin/telescope')
  require('plugin/indent-blankline')
  require('plugin/nvim-tree')
-- end
