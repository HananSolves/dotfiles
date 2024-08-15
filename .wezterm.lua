-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- Configuring the font to use
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16

-- Disabling tabs in wezterm
config.enable_tab_bar = false

-- Start wezterm terminal on full screen
config.initial_cols = 200
config.initial_rows = 50

-- Hiding the top bar
config.window_decorations = "RESIZE"

-- Background configuration
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- config.color_scheme = "Batman"
-- Josean Martinez's colorscheme
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

return config
