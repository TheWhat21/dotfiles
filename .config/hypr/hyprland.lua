-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "1920x1200@165.01",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = "Unknown-1",
	disabled = true,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "pcmanfm"
local menu = "toggle_rofi"
local browser = "librewolf"

-------------------------
---- NORD PALETTE  ----
-------------------------

-- https://www.nordtheme.com/docs/colors-and-palettes
-- Plain 6-digit hex, no "#" and no alpha, so they can be composed either way:
--   rgba string:  "rgba(" .. nord8 .. "ee)"
--   plugin int:   tonumber("f0" .. nord8, 16)   -- 0xf088c0d0

-- Polar Night (dark backgrounds / base UI)
local nord0 = "2e3440"
local nord1 = "3b4252"
local nord2 = "434c5e"
local nord3 = "4c566a"

-- Snow Storm (light text / bright UI)
local nord4 = "d8dee9"
local nord5 = "e5e9f0"
local nord6 = "eceff4"

-- Frost (accents, primary highlight colors)
local nord7 = "8fbcbb"
local nord8 = "88c0d0"
local nord9 = "81a1c1"
local nord10 = "5e81ac"

-- Aurora (errors / warnings / success / special)
local nord11 = "bf616a" -- red    - errors
local nord12 = "d08770" -- orange - advanced/dangerous
local nord13 = "ebcb8b" -- yellow - warnings
local nord14 = "a3be8c" -- green  - success
local nord15 = "b48ead" -- purple - special/uncommon

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd(
		"dbus-update-activation-environment DISPLAY I3SOCK SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland"
	)
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user restart xdg-desktop-portal.service")
	hl.exec_cmd("sleep 1 && /usr/lib/xdg-desktop-portal-hyprland &")

	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("waybar")
	hl.exec_cmd("mako")
	hl.exec_cmd("solaar -w hide")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

--THEYRE IN ~/.config/uwsm/env AND ~/.config/uwsm/env-hyprland

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
hl.permission("/usr/bin/hyprlock", "screencopy", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 2.5,
		gaps_out = 5,

		border_size = 1,

		col = {
			active_border = { colors = { "rgba(" .. nord8 .. "ee)", "rgba(" .. nord9 .. "ee)" }, angle = 45 },
			inactive_border = "rgba(" .. nord10 .. "aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 4.0,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.75,

		shadow = {
			enabled = true,
			range = 15,
			render_power = 4,
			color = "rgba(" .. nord1 .. "bf)",
			color_inactive = "rgba(" .. nord0 .. "aa)",
		},

		blur = {
			enabled = true,
			size = 1,
			-- variant = "k",
			passes = 5,
			vibrancy = 0.1696,
			noise = 0.0117, -- 0.08
			contrast = 1.5,
		},
	},

		decoration = {
			glass = {
			refraction = 20.0,
			size = 40.0,
			roughness = 1.0
		},

		acrylic = {
			refraction = 24.0,
			bulb = 28.0,
			clarity = 0.82,
			aberration = 0.025,
			tint = 0x14EEF5FF
		},

		drops = {
			speed = 3.0
		},

		heat_shimmer = {
			speed = 1.0
		},

		aurora = {
			speed = 1.0,
			iridescence = 0.35,
			color1 = 0x29F0A0FF,
			color2 = 0x7A4DFFFF
		},

		haze = {
			intensity = 0.35,
			iridescence = 0.7
		},

		ripple = {
			strength = 30.0,
			radius = 400.0,
			width = 32.0,
			duration = 0.45,
		},

		water = {
			strength = 32.0,
			radius = 20.0,
			speed = 0.76,
			damping = 0.95,
			duration = 12.0
		},

		fluid_jar = {
			color = 0xCC3399FF,
			speed = 3.7,
			fill_amount = 0.5,
			mass = 1.4,
			precision = 2.0,
			turbulence = 1.2,
			distortion = 8.0
		}
	},

	decoration = {
		rounding = 10,
		rounding_power = 4.0,
	
		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.75,
	
		shadow = {
			enabled = true,
			range = 15,
			render_power = 4,
			color = "rgba(" .. nord1 .. "bf)",
			color_inactive = "rgba(" .. nord0 .. "aa)",
		},

		motion_blur = {
			enabled = false,
			samples = 7,
		},
	
		-- wobble = {
		-- 	enabled = true,
		-- 	mesh = 12,
		-- 	stiffness = 20,
		-- 	damping = 12,
		-- 	mass = 1,
		-- 	intensity = 0.2,
		-- 	value_epsilon = 0.25,
		-- 	velocity_epsilon = 2,
		-- }
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuad", { type = "bezier", points = { { 0.5, 1 }, { 0.89, 1 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("overshootEaseOutExpo", { type = "bezier", points = { { 0.26, 1.1 }, { 0.4, 1.1 } } })
hl.curve("easeInExpo", { type = "bezier", points = { { 0.7, 0 }, { 0.84, 0 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutExpo" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutExpo" })
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4.1,
	bezier = "overshootEaseOutExpo",
	style = "slide",
})
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "easeOutQuint", style = "gnomed" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutExpo" })
hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 4,
	bezier = "overshootEaseOutExpo",
	style = "slide top",
})
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "popin" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.94,
	bezier = "overshootEaseOutExpo",
	style = "fade",
})
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "easeOutQuad", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "easeOutQuad", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		-- pseudotile	   = true,
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

hl.config({
	plugin = {
		gloview = {
			layout = "rows",
			gap = 34,
			padding = 80,
			padding_top = 40,
			padding_bottom = 70,
			max_scale = 1.0,
			preview_filter = "box16",
			duration = 200,
			preview_round = 12,
			blur = 1,

			switch_animation = 1,
			switch_duration = 260,
			move_animation = 1,
			move_duration = 240,

			strip_height = 150,
			strip_margin = 22,
			strip_gap = 18,
			strip_card_round = 10,

			focus_follows_mouse = 1,
			scroll_switches_workspace = 1,
			passthrough_keys = 1,
			exit_on_click = 1,
			exit_on_switch = 0,

			key_close = "escape",
			key_next_workspace = "tab",
			key_prev_workspace = "shift+tab",
			key_activate = "enter",
			key_close_window = "c",
			key_left = "left",
			key_right = "right",
			key_up = "up",
			key_down = "down",
			key_desktop = "alt",
			key_all_workspaces = "a",
			key_workspace = "1,2,3,4,5,6,7,8,9,0",

			show_all_workspaces = 0,
			show_empty = 0,
			dynamic_workspaces = 0,
			autodelete_empty = 1,
			show_workspace_labels = 1,
			show_window_labels = 1,
			show_special = 0,
			strip_all_card = 1,
			drag_to_swap = 1,
			switch_on_drop = 0,
			switch_on_new_workspace = 0,

			hide_top_layers = 1,
			hide_overlay_layers = 1,
			above_namespaces = "rofi notifications",
			debug_logs = 0,

			select_border_size = 3,
			select_border = tonumber("f0" .. nord8, 16), -- was sky blue -> nord8  (88c0d0)
			close_button_color = tonumber("e6" .. nord11, 16), -- was red      -> nord11 (bf616a)
			backdrop_color = tonumber("73" .. nord0, 16), -- was near-black navy -> nord0 (2e3440)
			strip_band_color = tonumber("24" .. nord6, 16), -- was white    -> nord6  (eceff4)
			strip_card_color = tonumber("3a" .. nord0, 16), -- was dark navy -> nord0 (2e3440)
			strip_active_color = tonumber("4d" .. nord1, 16), -- was dark blue -> nord1 (3b4252)
			strip_active_border = tonumber("f0" .. nord6, 16), -- was white    -> nord6  (eceff4)
			strip_hover_border = tonumber("80" .. nord6, 16), -- was white    -> nord6  (eceff4)
			strip_active_border_size = 2,
			strip_hover_border_size = 2,
			strip_plus_color = tonumber("d0" .. nord6, 16), -- was pale ice blue -> nord6 (eceff4, near-identical already)
			preview_bg = tonumber("ff" .. nord0, 16), -- was near-black -> nord0 (2e3440)
			shadow_color = tonumber("70" .. nord0, 16), -- was black    -> nord0  (2e3440)
			hover_border = tonumber("f0" .. nord6, 16), -- was white    -> nord6  (eceff4)
			hover_border_size = 3,
		},
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true,
		animate_manual_resizes = true,
		enable_swallow = true,
		swallow_regex = "^(kitty)$",
	},
	debug = {
		vfr = true,
	},
})

hl.plugin.kinetic_scroll.disable("org.telegram.desktop")
hl.plugin.kinetic_scroll.disable("librewolf")
hl.plugin.kinetic_scroll.disable("pcmanfm")
hl.plugin.kinetic_scroll.disable("kitty")
hl.plugin.kinetic_scroll.disable("vencord")

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "gb",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			disable_while_typing = false,
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more

---------------------
---- KEYBINDINGS ----
---------------------

local function closeAllWindows()
	local windows = hl.get_windows()

	for _, w in pairs(windows) do
		hl.dispatch(hl.dsp.window.close({ window = w }))
	end
end

local function closeAllWindowsCurrentWorkspace()
	local cws = hl.get_active_workspace()
	local windows = hl.get_windows({ workspace = cws })

	for _, w in pairs(windows) do
		hl.dispatch(hl.dsp.window.close({ window = w }))
	end
end

local function moveWindowsCurrentWorkspace(ws, f)
	local cws = hl.get_active_workspace()
	local windows = hl.get_windows({ workspace = cws })

	for _, w in pairs(windows) do
		hl.dispatch(hl.dsp.window.move({
			window = w,
			workspace = ws,
			follow = f,
		}))
	end
end

-- ~/.config/hypr/hyprland.lua

local DEFAULT_LONG_PRESS_MS = 400

local function short_or_long_press(key, short_action, long_action, long_press_ms)
	long_press_ms = long_press_ms or 400

	local longPressFired = false
	local pressTimer = nil

	hl.bind(key, function()
		longPressFired = false

		-- Fresh timer every press — reusing one oneshot timer across
		-- presses is what was causing the flaky long-press detection.
		pressTimer = hl.timer(function()
			longPressFired = true
			long_action()
		end, { timeout = long_press_ms, type = "oneshot" })
	end)

	hl.bind(key, function()
		if pressTimer then
			pressTimer:set_enabled(false)
		end
		if not longPressFired then
			short_action()
		end
	end, { release = true })
end

-- Opens a rofi menu listing every layout and applies the chosen one
-- to whichever workspace (or special workspace) was active when the
-- key was pressed.
local function open_layout_picker()
	local layouts = { "dwindle", "scrolling", "monocle", "master" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	if not workspace then
		return
	end

	local target = workspace.special and tostring(workspace.name) or tostring(workspace.id)

	local quoted = {}
	for _, layout in ipairs(layouts) do
		quoted[#quoted + 1] = string.format('"%s"', layout)
	end
	local layouts_arg = table.concat(quoted, " ")

	-- Runs async via hl.exec_cmd (shell), captures rofi's pick, then
	-- feeds it back into the config through `hyprctl eval`.
	local cmd = string.format(
    	[[pgrep -x rofi >/dev/null 2>&1 && killall rofi || { choice=$(printf '%%s\n' %s | rofi -dmenu -i -p "Layout" -theme-str "window { height: 17.5%%; width: 12.5%%; }"); [ -n "$choice" ] && hyprctl eval "apply_picked_layout(\"%s\", \"$choice\")"; }]],
    	layouts_arg, target
	)

	hl.exec_cmd(cmd)
end

-- A window rule matching a throwaway placeholder window: fully invisible,
-- unfocused, no animation. It exists purely so we can trigger a genuine
-- open+close event (the one thing you've confirmed actually fixes the
-- stale monocle border/rounding), without anything visibly flashing.
hl.window_rule({
	name = "decoration-refresh-ghost",
	match = { title = "^__hl_decoration_refresh__$" },

	float = true,
	no_anim = true,
	no_focus = true,
	no_initial_focus = true,
	pin = true,
	size = { 1, 1 },
	opacity = "0.0",
})

-- `true` exits instantly, so kitty opens and immediately closes on its own.
-- That open/close cycle is what forces Hyprland to refresh every window's
-- decoration state on the workspace — the same thing that already fixes
-- it when you manually open/close something.
local function force_decoration_refresh()
	hl.exec_cmd([[kitty --title __hl_decoration_refresh__ -e true]])
end

function apply_picked_layout(target, layout)
	hl.workspace_rule({ workspace = target, layout = layout })
	hl.exec_cmd("switch_waybar " .. ((layout == "scrolling") and "left" or "top"))
	if hl.get_active_workspace().tiled_layout == "master" and layout == "dwindle" then
		hl.exec_cmd("notify-send Dwindle")
	end
	force_decoration_refresh()
end

-- Auto-sync waybar orientation whenever the active workspace's layout differs
-- from what's currently displayed (e.g. switching workspaces with mainMod+[0-9])
hl.on("workspace.active", function(ws)
	if not ws then
		return
	end

	if ws.tiled_layout == "scrolling" then
		hl.exec_cmd("switch_waybar left")
		hl.animation({
			leaf = "workspacesIn",
			enabled = true,
			speed = 1.815,
			bezier = "easeOutQuad",
			style = "slide bottom",
		})
		hl.animation({
			leaf = "workspacesOut",
			enabled = true,
			speed = 2.91,
			bezier = "easeOutQuad",
			style = "slide top",
		})
	elseif ws.tiled_layout == "dwindle" then
		hl.exec_cmd("switch_waybar top")
		hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "easeOutQuad", style = "slide" })
		hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "easeOutQuad", style = "slide" })
	end
end)

local function layout_bind(bind_table)
	return function()
		local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

		if not workspace then
			return
		end

		local layout = workspace.tiled_layout

		if bind_table[layout] then
			hl.dispatch(bind_table[layout])
		end
	end
end

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("toggle_rofi_clipboard"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(
	mainMod .. " + SHIFT + J",
	layout_bind({
		dwindle = hl.dsp.layout("togglesplit"),
		scrolling = hl.dsp.layout("consume_or_expel next"),
	})
)
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("toggle_waybar"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("toggle_linux-wallpaperengine-gui"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("toggle_rofi_emoji"))
hl.bind(mainMod .. " + tab", hl.dsp.exec_cmd("hyprlock"))
hl.bind("PRINT", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("flameshot screen"))
-- hl.bind("F10")
short_or_long_press("SUPER + X", function()
	local layouts = { "dwindle", "scrolling" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			local waybar_layout = (next_layout == "scrolling") and "left" or "top"
			if layouts[i] == "master" and next_layout == "dwindle" then
				
				hl.exec_cmd("notify-send Dwindle")
			end
			hl.exec_cmd("switch_waybar " .. waybar_layout)
			break
		end
	end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
	force_decoration_refresh()
end, open_layout_picker, DEFAULT_LONG_PRESS_MS)

hl.bind("SUPER + grave", function()
	local active = hl.get_active_workspace()
	local anchor = "top"
	if active and active.tiled_layout == "scrolling" then
		anchor = "left"
	end
	hl.exec_cmd("hyprctl eval 'hl.config({ plugin = { gloview = { anchor = \"" .. anchor .. "\" } } })'")

	hl.timer(function()
		hl.plugin.gloview.toggle()
	end, { timeout = 100, type = "oneshot" })
end)
hl.bind("XF86Launch1", hl.dsp.exec_cmd("rog-control-center"))
short_or_long_press("SUPER + BackSpace", closeAllWindowsCurrentWorkspace, closeAllWindows, 5000)

-- Move focus with mainMod + arrow keys
hl.bind(
	mainMod .. " + left",
	layout_bind({
		dwindle = hl.dsp.focus({ direction = "left" }),
		scrolling = hl.dsp.focus({ direction = "left" }),
		monocle = hl.dsp.layout("cycleprev"),
		master = hl.dsp.layout("cycleprev"),
	})
)
hl.bind(
	mainMod .. " + right",
	layout_bind({
		dwindle = hl.dsp.focus({ direction = "right" }),
		scrolling = hl.dsp.focus({ direction = "right" }),
		monocle = hl.dsp.layout("cyclenext"),
		master = hl.dsp.layout("cyclenext"),
	})
)
hl.bind(
	mainMod .. " + up",
	layout_bind({
		dwindle = hl.dsp.focus({ direction = "up" }),
		scrolling = hl.dsp.focus({ direction = "up" }),
		monocle = hl.dsp.layout("cycleprev"),
		master = hl.dsp.layout("cycleprev"),
	})
)
hl.bind(
	mainMod .. " + down",
	layout_bind({
		dwindle = hl.dsp.focus({ direction = "down" }),
		scrolling = hl.dsp.focus({ direction = "down" }),
		monocle = hl.dsp.layout("cyclenext"),
		master = hl.dsp.layout("cyclenext"),
	})
)

-- Move window with mainMod + SHIFT + arrow keys
hl.bind(
	mainMod .. " + SHIFT + left",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol l"),
		dwindle = hl.dsp.window.move({ direction = "left" }),
	})
)
hl.bind(
	mainMod .. " + SHIFT + right",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol r"),
		dwindle = hl.dsp.window.move({ direction = "right" }),
	})
)
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Resize window with mainMod + CTRL + arrow keys
hl.bind(
	mainMod .. " + CTRL + left",
	layout_bind({
		dwindle = hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
		scrolling = hl.dsp.layout("colresize -0.01"),
	}),
	{ repeating = true }
)

hl.bind(
	mainMod .. " + CTRL + right",
	layout_bind({
		dwindle = hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
		scrolling = hl.dsp.layout("colresize +0.01"),
	}),
	{ repeating = true }
)
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	hl.bind("SUPER+SHIFT+ALT+" .. key, function()
		moveWindowsCurrentWorkspace(i, true)
	end)
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + CTRL + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && volume-notify"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && volume-notify"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && volume-notify"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && mic-notify"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+ && brightness-notify"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%- && brightness-notify"),
	{ locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "pip-opacity",
	match = { initial_title = "Picture-in-Picture" },

	float = true,
	opaque = true,
	rounding = 0,
	rounding_power = 1,
	border_size = 0,
	pin = true,
})

hl.window_rule({
	name = "xwayland-video-bridge-fixes",
	match = { class = "xwaylandvideobridge" },

	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	max_size = { 1, 1 },
	opacity = "0.0",
})

-- hl.window_rule({
-- 	name = "flameshot-multi-display-fix",
-- 	match = { class = "flameshot" },
--
-- 	animation = "fade",
-- 	rounding = 0,
-- 	border_size = 0,
--     fullscreen_state = "0 0",
--     float = true,
--     pin = true,
--     monitor = "eDP-1",
--     move = { 0, 0 },
--     size = {"(monitor_w*2)", "(monitor_h)"}
-- })

hl.window_rule({
	name = "flameshot-fade",
	match = { class = "flameshot" },

	animation = "fadeOut",
	-- rounding = 0,
	-- border_size = 0,
	-- fullscreen_state = "0 0",
	-- float = on,
	-- pin = on,
	-- monitor = "eDP-1",
	-- move = { 0, 0 },
	-- size = {"(monitor_w*2)", "(monitor_h)"}
})

hl.layer_rule({
	name = "animate-wallpaper",
	match = { namespace = "hyprpaper" },

	animation = "fade",
})

hl.layer_rule({
	name = "panel",
	match = { namespace = "waybar" },

	blur = true,
	blur_popups = true,
	ignore_alpha = 0.25,
	animation = "fadeLayersOut",
})

hl.layer_rule({
	name = "rofi",
	match = { namespace = "rofi" },

	blur = true,
	ignore_alpha = 0.25,
	animation = "fadeLayersOut",
})

hl.layer_rule({
	name = "notifs",
	match = { namespace = "notifications" },

	blur = true,
	blur_popups = true,
	ignore_alpha = 0.5,
	animation = "slide right",
})

hl.layer_rule({
	name = "no-animate-picker",
	match = { namespace = "hyprpicker" },

	no_anim = true,
})

hl.layer_rule({
	name = "fade-hyprshutdown",
	match = { namespace = "hyprshutdown" },

	animation = "fadeLayersOut",
})
