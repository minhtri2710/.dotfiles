require("utils/custom_tab")
local mouse_bindings = require("utils/mouse_bindings")

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {
	default_prog = { "pwsh" },

	font_size = 11,
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Medium" }),
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- general options
	adjust_window_size_when_changing_font_size = false,
	debug_key_events = false,
	native_macos_fullscreen_mode = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_background_opacity = 0.90,
	macos_window_background_blur = 16,

	-- makes my cursor blink
	default_cursor_style = "BlinkingBar",
	cursor_blink_rate = 800,

	inactive_pane_hsb = {
		saturation = 0.7,
		brightness = 0.3,
	},

	window_background_gradient = {
		orientation = "Vertical",
		colors = {
			"#1E1E2F",
			"#1E1E2F",
		},
		blend = "Rgb",
		interpolation = "Linear",
	},

	mouse_bindings = mouse_bindings,

	-- tab options
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,

	-- keys
	keys = {
		-- paste from the clipboard
		{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

		-- paste from the primary selection
		{ key = "v", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
	},
}

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	wezterm.log_info("name", name)
	wezterm.log_info("value", value)

	if name == "T_SESSION" then
		local session = value
		wezterm.log_info("is session", session)
	end

	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
		else
			overrides.font_size = number_value
		end
	end
	if name == "DIFF_VIEW" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.DecreaseFontSize, pane)
				number_value = number_value - 1
			end
			-- overrides.background = {
			-- 	w.set_nvim_wallpaper("Diffview.jpeg"),
			--
			-- 	{
			-- 		source = {
			-- 			Gradient = {
			-- 				colors = { "#000000" },
			-- 			},
			-- 		},
			-- 		width = "100%",
			-- 		height = "100%",
			-- 		opacity = 0.95,
			-- 	},
			-- }
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.background = nil
			overrides.font_size = nil
		else
			overrides.font_size = number_value
		end
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
