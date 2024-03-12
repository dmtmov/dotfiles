local wezterm = require 'wezterm'
local config = wezterm.config_builder()


-- config.font = wezterm.font('JetBrainsMono Nerd Font')
-- config.font = wezterm.font('Zed Mono')
config.font = wezterm.font('M+1Code Nerd Font Mono')
-- config.font = wezterm.font('Monaspace Neon')
config.font_size = 16

config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.window_padding = {
    -- left = '1cell',
    -- right = '1cell',
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.window_background_opacity = 1.0

config.scrollback_lines = 99999

-- Split panes
config.keys = {
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical
    },
    {
        key = 'd',
        mods = 'CMD',
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
    {
        key = 'h',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
}
config.skip_close_confirmation_for_processes_named = {
    'bash',
    'sh',
    -- 'zsh',
    -- 'tmux',
    -- 'nvim',
    -- 'k9s',
    -- 'ctop',
    -- 'ssh'
}
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
-- config.window_decorations = "RESIZE"

if wezterm.gui.get_appearance():find 'Dark' then
    -- config.color_scheme = 'Gruvbox dark, hard (base16)'
    -- config.color_scheme = 'Gruvbox dark, medium (base16)'
    -- config.color_scheme = 'Gruvbox dark, pale (base16)'
    -- config.color_scheme = 'Gruvbox dark, soft (base16)'
    -- config.color_scheme = 'GruvboxDark'
    -- config.color_scheme = 'Rosé Pine Moon (Gogh)'
    config.color_scheme = 'Gruvbox Dark (Gogh)'
else
    --config.colors = require('lua.flexoki_colors').light()
    --config.color_scheme = 'Rosé Pine Dawn (base16)'
    config.color_scheme = 'Rosé Pine Dawn (Gogh)'
end

return config
