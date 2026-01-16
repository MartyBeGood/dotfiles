return {
	"nvim-mini/mini.indentscope",
	version = "*",
	opts = {},

	config = function(_, opts)
		require("mini.indentscope").setup(opts)

		local special_types = require("basics.internals.special_types")
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		local group = "BasicsMiniIndentScope"

		augroup(group, { clear = true })
		autocmd("FileType", {
			group = group,
			pattern = special_types.ui_style_filetypes,
			callback = function()
				vim.api.nvim_buf_set_var(vim.api.nvim_get_current_buf(), "miniindentscope_disable", true)
			end,
		})

		autocmd("FileType", {
			group = group,
			pattern = special_types.filetypes_where_indent_has_meaning,
			callback = function()
				vim.api.nvim_buf_set_var(
					vim.api.nvim_get_current_buf(),
					"miniindentscope_config",
					{ options = { border = "top" } }
				)
			end,
		})
	end,
}
