-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- use Hack with Nerd Font glyphs
wezterm.font("Hack Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 14

-- set background opacity
config.window_background_opacity = .85
config.macos_window_background_blur = 10

-- set initial size
config.initial_rows = 36
config.initial_cols = 120

-- enable scrollbar
config.enable_scroll_bar = true

-- disable quit prompt
config.window_close_confirmation = 'NeverPrompt'

-- hide the tab bar if there is only one tab
config.hide_tab_bar_if_only_one_tab = true

-- hide the window decorations
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
