local M = {}

M.ui_style_filetypes = {
	"lspinfo",
	"packer",
	"checkhealth",
	"help",
	"man",
	"notify",
	"dashboard",
	"fugitive",
	"neo-tree",
	"", -- terminals have this one
}

M.ui_style_buftypes = {
	"terminal",
	"quickfix",
	"nofile",
	"prompt",
}

M.filetypes_where_indent_has_meaning = {
	"python",
	"slim",
	"yaml",
}

return M
