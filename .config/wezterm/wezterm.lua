local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 16
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.window_background_opacity = 0.85
config.macos_window_background_blur = 50
config.scrollback_lines = 99999

config.keys = require'keys'
config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = wezterm.action.Nop,
    },
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "TITLE | RESIZE"

if wezterm.gui.get_appearance():find 'Dark' then
    -- config.color_scheme = 'Gruvbox dark, hard (base16)'
    -- config.color_scheme = 'Gruvbox dark, medium (base16)'
    -- config.color_scheme = 'Gruvbox dark, pale (base16)'
    -- config.color_scheme = 'Gruvbox dark, soft (base16)'
    -- config.color_scheme = 'GruvboxDark'
    -- config.color_scheme = 'Rosé Pine Moon (Gogh)'
    -- config.color_scheme = 'Gruvbox Dark (Gogh)'
    config.color_scheme = 'Kanagawa (Gogh)'
    config.colors = {
        background = 'black',
    }
else
    --config.colors = require('lua.flexoki_colors').light()
    --config.color_scheme = 'Rosé Pine Dawn (base16)'
    config.color_scheme = 'Rosé Pine Dawn (Gogh)'
end

return config
