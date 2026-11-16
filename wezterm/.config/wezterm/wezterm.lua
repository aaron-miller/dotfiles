-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.audible_bell = "Disabled"

-- fix shift + enter on opencode
config.keys = {
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\x1b[13;2u"),
	},
}

-- send alt+1..0 when cmd+1..0 is pressed
for _, digit in ipairs({ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }) do
	table.insert(config.keys, {
		key = digit,
		mods = "CMD",
		action = wezterm.action.SendString("\x1b" .. digit),
	})
end

-- use Hack with Nerd Font glyphs
wezterm.font("Hack Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 20

-- Colorscheme
config.color_scheme = "Catppuccin Mocha"

-- set background opacity
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- set initial size
config.initial_rows = 36
config.initial_cols = 120

-- enable scrollbar
config.enable_scroll_bar = true

-- disable quit prompt
config.window_close_confirmation = "NeverPrompt"

-- hide the tab bar if there is only one tab
config.hide_tab_bar_if_only_one_tab = true

-- hide the window decorations
if wezterm.target_triple == "aarch64-apple-darwin" then
	config.window_decorations = "RESIZE"
end

-- start a login zsh from the nix profile on linux
if wezterm.target_triple:find("linux") then
	config.default_prog = { wezterm.home_dir .. "/.nix-profile/bin/zsh", "-l" }
end

-- pi keybinds
config.enable_kitty_keyboard = true

-- and finally, return the configuration to wezterm
return config
