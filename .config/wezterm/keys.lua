local wezterm = require('wezterm')
local act = wezterm.action

local M = {}

M.bindings = {
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = act.SplitVertical
    },
    {
        key = 'd',
        mods = 'CMD',
        action = act.SplitHorizontal
    },
    {
        key = 'Enter',
        mods = 'CMD|SHIFT',
        action = act.TogglePaneZoomState,
    },
    {
        key = 'LeftArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        key = 'h',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        key = 'w',
        mods = 'CMD',
        action = act.CloseCurrentPane { confirm = true },
    },
    { key = "L", mods = "CMD|SHIFT", action = "ShowLauncher" },
    { key = "T", mods = "CMD|SHIFT", action = "ShowTabNavigator" },
    { key = "f", mods = "CMD|CTRL",  action = "ToggleFullScreen" },
    { key = " ", mods = "CMD|SHIFT", action = wezterm.action.QuickSelect },
    { key = "z", mods = "CMD",       action = wezterm.action.TogglePaneZoomState },
    -- {
    --     key = "h",
    --     mods = "CMD|SHIFT",
    --     action = wezterm.action_callback(function(window, pane)
    --         local overrides = window:get_config_overrides() or {}
    --         if not overrides.window_decorations
    --             or overrides.window_decorations == "TITLE | RESIZE" then
    --             overrides.window_decorations = "RESIZE"
    --         else
    --             overrides.window_decorations = "TITLE | RESIZE"
    --         end
    --         window:set_config_overrides(overrides)
    --     end),
    -- },
}

return M
