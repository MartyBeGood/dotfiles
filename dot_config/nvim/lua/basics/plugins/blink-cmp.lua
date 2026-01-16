return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "enter",
		},
		completion = {
			list = {
				selection = {
					preselect = false,
				},
			},
			ghost_text = {
				enabled = false,
				show_with_selection = false,
			},
		},
	},
}
