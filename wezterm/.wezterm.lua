-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- use Hack with Nerd Font glyphs
wezterm.font("Hack Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 12

-- set background opacity
config.window_background_opacity = .8

-- set initial size
config.initial_rows = 36
config.initial_cols = 120

-- and finally, return the configuration to wezterm
return config
