local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
config.color_scheme = "rose-pine-moon"
config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
})

wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

config.launch_menu = {
	{
		args = { "btop" },
	},
	{
		args = { "fish" },
	},
	{
		args = { "bash" },
	},
}

config.leader = { key = "Space", mods = "CTRL" }
config.keys = {
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "ALT|SHIFT",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "a",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "activate_pane",
			timeout_milliseconds = 1000,
		}),
	},
	{
		key = "t",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "activate_tab",
			timeout_milliseconds = 1000,
		}),
	},
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Left",
		}),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Left",
		}),
	},
	{
		key = "RightArrow",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Right",
		}),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Right",
		}),
	},
	{
		key = "UpArrow",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Up",
		}),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Up",
		}),
	},
	{
		key = "DownArrow",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Down",
		}),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Down",
		}),
	},
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},

	-- Defines the keys that are active in our activate-pane mode.
	-- 'activate_pane' here corresponds to the name="activate_pane" in
	-- the key assignments above.
	activate_pane = {
		{ key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
		{ key = "h", action = act.ActivatePaneDirection("Left") },

		{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },

		{ key = "UpArrow", action = act.ActivatePaneDirection("Up") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },

		{ key = "DownArrow", action = act.ActivatePaneDirection("Down") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },
	},

	activate_tab = {
		{ key = "LeftArrow", action = act.ActivateTabRelative(-1) },
		{ key = "h", action = act.ActivateTabRelative(-1) },
		{ key = "RightArrow", action = act.ActivateTabRelative(1) },
		{ key = "l", action = act.ActivateTabRelative(1) },
		{
			key = "n",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "n",
			mods = "SHIFT",
			action = act.ShowTabNavigator,
		},
	},
}

return config
