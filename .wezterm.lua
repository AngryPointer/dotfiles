local wezterm = require 'wezterm'

local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)



-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12

-- config.color_scheme = "Batman"
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "tokyonight"

-- config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 1.0

-- and finally, return the configuration to wezterm
return config
