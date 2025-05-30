local wezterm = require("wezterm")
-- local act =

local is_windows = wezterm.target_triple:find("windows") ~= nil
local is_mac = wezterm.target_triple:find("darwin") ~= nil

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
		return "Apple System Colors"
	else
		return "Vs Code Light+ (Gogh)"
	end
end

local extra_colors_by_appearance = function()
	local mcolors = {}

	if dark_mode() then
		mcolors.cursor_bg = extra_colors.cursor
		mcolors.cursor_border = extra_colors.cursor
		-- mcolors.tab_bar = { background = extra_colors.background }
	end

	return mcolors
end

local c = wezterm.config_builder()

c.send_composed_key_when_right_alt_is_pressed = true
c.use_dead_keys = false
c.use_ime = false
c.adjust_window_size_when_changing_font_size = false

c.color_scheme = theme_by_appearance()
c.colors = extra_colors_by_appearance()

c.hide_tab_bar_if_only_one_tab = true
c.window_padding = {
	left = 0,
	right = 0,
	top = 1,
	bottom = 0,
}
c.audible_bell = "Disabled"

c.font_size = 14
c.cell_width = 0.9
-- c.line_height = 1.15
c.underline_position = -4
c.font = wezterm.font_with_fallback({
	{ family = "Iosevka Term", stretch = "Expanded" },
	{ family = "Cascadia Code", weight = "DemiLight" },
	"JetBrainsMono Nerd Font Propo",
})

local italics_font = "Iosevka"
local use_separate_italics_font = false

if use_separate_italics_font then
	c.font_rules = {
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font({ family = italics_font, weight = "Bold", style = "Italic", stretch = "Expanded" }),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({ family = italics_font, weight = "DemiBold", style = "Italic", stretch = "Expanded" }),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({ family = italics_font, style = "Italic", stretch = "Expanded" }),
		},
	}
end

if is_windows then
	c.default_prog = { "pwsh" }
	c.mux_enable_ssh_agent = false -- The Win OpenSSH agent works fine. Don't misconfigure yourself.
end

return c
