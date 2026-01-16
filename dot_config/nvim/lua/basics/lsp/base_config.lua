vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		focusable = false,
		source = true,
		border = "none",
		header = "",
		prefix = "",
	},
	signs = {
		text = {
			-- a bug symbol for errors
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "󰌶",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
})
