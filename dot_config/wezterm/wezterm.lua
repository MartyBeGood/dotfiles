local wezterm = require("wezterm")

local extra_colors = {
	cursor = "#ff9808",
}

local dark_mode = function()
	if wezterm.gui then
		return wezterm.gui.get_appearance():find("Dark")
	end

	return true
end

local theme_by_appearance = function()
	if dark_mode() then
		return "Dark+"
	else
		return "GruvboxLight"
	end
end

local extra_colors_by_appearance = function()
	local mcolors = {}

	if dark_mode() then
		mcolors.background = "#1e1e1e"

		mcolors.cursor_bg = extra_colors.cursor
		mcolors.cursor_border = extra_colors.cursor
		mcolors.tab_bar = { background = extra_colors.background }
	end

	return mcolors
end

local settings = {
	-- Keyboard-related settings
	send_composed_key_when_right_alt_is_pressed = true,
	send_composed_key_when_left_alt_is_pressed = false,
	use_dead_keys = false,
	use_ime = false,

	-- Colors
	color_scheme = theme_by_appearance(),
	colors = extra_colors_by_appearance(),

	-- UI-related settings
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	adjust_window_size_when_changing_font_size = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 1,
		bottom = 0,
	},
	audible_bell = "Disabled",

	-- Font settings
	font_size = 11,
	cell_width = 0.88,
	underline_position = -4,
	font = wezterm.font("Nerdosevka"),

	-- to make wezterm respect the GTK theme on wayland
	enable_wayland = false,
}

return settings
