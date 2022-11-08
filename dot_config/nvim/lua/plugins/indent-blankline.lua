-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim


local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

indent_blankline.setup {
  char = "▏",
  use_treesitter = false,
  strict_tabs = true,
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = true,
  filetype_exclude = {
    'help',
    'dashboard',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
    'NvimTree',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
}
