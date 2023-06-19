local wezterm = require 'wezterm'
local config = wezterm.config_builder()


config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Medium', stretch='Normal', style='Normal' })
config.font_size = 14

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = 0,
  bottom = 0,
}
config.tab_bar_at_bottom = true
config.window_background_opacity = 1.0

-- Split panes
config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitVertical
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal
  },
  {
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
}


local function scheme_for_appearance()
	if wezterm.gui.get_appearance():find 'Dark' then
		config.colors = require('lua/rose-pine-moon').colors()	-- Medium
		--config.colors = require('lua/rose-pine').colors()	-- Dark
  	else
		config.colors = require('lua/rose-pine-dawn').colors()  -- Light
  	end
end

config.color_scheme = scheme_for_appearance()
config.colors.tab_bar.active_tab.bg_color = 'darkgrey'
config.colors.tab_bar.active_tab.fg_color = 'black'

return config

