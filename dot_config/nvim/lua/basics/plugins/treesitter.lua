return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
		},
		lazy = false,
		build = ":TSUpdate",
		opts = {},
	},

	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				disable = { "ruby" }, -- Treesitter dedents when you enter a . in a method (since something.end is valid ruby)
			},
			endwise = {
				enable = true,
			},
		},
	},
}
