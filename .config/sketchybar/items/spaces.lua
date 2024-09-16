local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}

local swapWatcher = sbar.add("item", {
	drawing = false,
	updates = true,
})

local currentWorkspaceWatcher = sbar.add("item", {
	drawing = false,
	updates = true,
})

local spaceConfigs <const> = {
	["1"] = { icon = "󰘦", name = "Coding" },
	["2"] = { icon = "󰣇", name = "Terminal" },
	["3"] = { icon = "󰖟", name = "Web" },
	["4"] = { icon = "󰚢", name = "Communicaiton" },
	["5"] = { icon = "󱃾", name = "Dev Tools" },
	["6"] = { icon = "󰕄", name = "Social Media" },
	["7"] = { icon = "󰝚", name = "Music" },
}

local function selectCurrentWorkspace(focusedWorkspaceName)
	for sid, item in pairs(spaces) do
		if item ~= nil then
			local isSelected = sid == "workspaces" .. "." .. focusedWorkspaceName
			item:set({
				icon = { color = isSelected and colors.bg1 or colors.white },
				label = { color = isSelected and colors.bg1 or colors.white },
				background = { color = isSelected and colors.white or colors.bg1 },
			})
		end
	end

	sbar.trigger("update_windows")
end

local function findAndSelectCurrentWorkspace()
	sbar.exec("aerospace list-workspaces --focused", function(focusedWorkspaceOutput)
		local focusedWorkspaceName = focusedWorkspaceOutput:match("[^\r\n]+")
		selectCurrentWorkspace(focusedWorkspaceName)
	end)
end

local function addWorkspaceItem(workspaceName)
	local spaceName = "workspaces" .. "." .. workspaceName
	local spaceConfig = spaceConfigs[workspaceName]

	spaces[spaceName] = sbar.add("item", spaceName, {
		label = {
			width = 0,
			padding_left = 0,
			string = spaceConfig.name,
		},
		icon = {
			string = spaceConfig.icon or app_icons["default"],
			color = colors.white,
		},
		background = {
			color = colors.bg1,
		},
		click_script = "aerospace workspace " .. workspaceName,
	})

	spaces[spaceName]:subscribe("mouse.entered", function(env)
		sbar.animate("tanh", 30, function()
			spaces[spaceName]:set({ label = { width = "dynamic" } })
		end)
	end)

	spaces[spaceName]:subscribe("mouse.exited", function(env)
		sbar.animate("tanh", 30, function()
			spaces[spaceName]:set({ label = { width = 0 } })
		end)
	end)

	sbar.add("item", spaceName .. ".padding", {
		width = 8,
	})
end

local function createWorkspaces()
	sbar.exec("aerospace list-workspaces --all", function(workspaceOutput)
		for workspaceName in workspaceOutput:gmatch("[^\r\n]+") do
			addWorkspaceItem(workspaceName)
		end

		findAndSelectCurrentWorkspace()
	end)
end

swapWatcher:subscribe("swap_menu_and_spaces", function(env)
	local isShowingSpaces = env.isShowingMenu == "off" and true or false
	sbar.set("/" .. "workspaces" .. "\\..*/", { drawing = isShowingSpaces })
end)

currentWorkspaceWatcher:subscribe("aerospace_workspace_changed", function(env)
	selectCurrentWorkspace(env.FOCUSED_WORKSPACE)
	sbar.trigger("update_windows")
end)

createWorkspaces()

-- for i = 1, 10, 1 do
-- 	local space = sbar.add("space", "space." .. i, {
-- 		space = i,
-- 		icon = {
-- 			font = { family = settings.font.numbers },
-- 			string = i,
-- 			padding_left = 15,
-- 			padding_right = 8,
-- 			color = colors.white,
-- 			highlight_color = colors.red,
-- 		},
-- 		label = {
-- 			padding_right = 20,
-- 			color = colors.grey,
-- 			highlight_color = colors.white,
-- 			font = "sketchybar-app-font:Regular:16.0",
-- 			y_offset = -1,
-- 		},
-- 		padding_right = 1,
-- 		padding_left = 1,
-- 		background = {
-- 			color = colors.bg1,
-- 			border_width = 1,
-- 			height = 26,
-- 			border_color = colors.black,
-- 		},
-- 		popup = { background = { border_width = 5, border_color = colors.black } },
-- 	})
--
-- 	spaces[i] = space
--
-- 	-- Single item bracket for space items to achieve double border on highlight
-- 	local space_bracket = sbar.add("bracket", { space.name }, {
-- 		background = {
-- 			color = colors.transparent,
-- 			border_color = colors.bg2,
-- 			height = 28,
-- 			border_width = 2,
-- 		},
-- 	})
--
-- 	-- Padding space
-- 	sbar.add("space", "space.padding." .. i, {
-- 		space = i,
-- 		script = "",
-- 		width = settings.group_paddings,
-- 	})
--
-- 	local space_popup = sbar.add("item", {
-- 		position = "popup." .. space.name,
-- 		padding_left = 5,
-- 		padding_right = 0,
-- 		background = {
-- 			drawing = true,
-- 			image = {
-- 				corner_radius = 9,
-- 				scale = 0.2,
-- 			},
-- 		},
-- 	})
--
-- 	space:subscribe("space_change", function(env)
-- 		local selected = env.SELECTED == "true"
-- 		local color = selected and colors.grey or colors.bg2
-- 		space:set({
-- 			icon = { highlight = selected },
-- 			label = { highlight = selected },
-- 			background = { border_color = selected and colors.black or colors.bg2 },
-- 		})
-- 		space_bracket:set({
-- 			background = { border_color = selected and colors.grey or colors.bg2 },
-- 		})
-- 	end)
--
-- 	space:subscribe("mouse.clicked", function(env)
-- 		if env.BUTTON == "other" then
-- 			space_popup:set({ background = { image = "space." .. env.SID } })
-- 			space:set({ popup = { drawing = "toggle" } })
-- 		else
-- 			local op = (env.BUTTON == "right") and "--destroy" or "--focus"
-- 			sbar.exec("yabai -m space " .. op .. " " .. env.SID)
-- 		end
-- 	end)
--
-- 	space:subscribe("mouse.exited", function(_)
-- 		space:set({ popup = { drawing = false } })
-- 	end)
-- end
--
-- local space_window_observer = sbar.add("item", {
-- 	drawing = false,
-- 	updates = true,
-- })
--
-- local spaces_indicator = sbar.add("item", {
-- 	padding_left = -3,
-- 	padding_right = 0,
-- 	icon = {
-- 		padding_left = 8,
-- 		padding_right = 9,
-- 		color = colors.grey,
-- 		string = icons.switch.on,
-- 	},
-- 	label = {
-- 		width = 0,
-- 		padding_left = 0,
-- 		padding_right = 8,
-- 		string = "Spaces",
-- 		color = colors.bg1,
-- 	},
-- 	background = {
-- 		color = colors.with_alpha(colors.grey, 0.0),
-- 		border_color = colors.with_alpha(colors.bg1, 0.0),
-- 	},
-- })
--
-- space_window_observer:subscribe("space_windows_change", function(env)
-- 	local icon_line = ""
-- 	local no_app = true
-- 	for app, count in pairs(env.INFO.apps) do
-- 		no_app = false
-- 		local lookup = app_icons[app]
-- 		local icon = ((lookup == nil) and app_icons["default"] or lookup)
-- 		icon_line = icon_line .. " " .. icon
-- 	end
--
-- 	if no_app then
-- 		icon_line = " —"
-- 	end
-- 	sbar.animate("tanh", 10, function()
-- 		spaces[env.INFO.space]:set({ label = icon_line })
-- 	end)
-- end)
--
-- spaces_indicator:subscribe("swap_menus_and_spaces", function(env)
-- 	local currently_on = spaces_indicator:query().icon.value == icons.switch.on
-- 	spaces_indicator:set({
-- 		icon = currently_on and icons.switch.off or icons.switch.on,
-- 	})
-- end)
--
-- spaces_indicator:subscribe("mouse.entered", function(env)
-- 	sbar.animate("tanh", 30, function()
-- 		spaces_indicator:set({
-- 			background = {
-- 				color = { alpha = 1.0 },
-- 				border_color = { alpha = 1.0 },
-- 			},
-- 			icon = { color = colors.bg1 },
-- 			label = { width = "dynamic" },
-- 		})
-- 	end)
-- end)
--
-- spaces_indicator:subscribe("mouse.exited", function(env)
-- 	sbar.animate("tanh", 30, function()
-- 		spaces_indicator:set({
-- 			background = {
-- 				color = { alpha = 0.0 },
-- 				border_color = { alpha = 0.0 },
-- 			},
-- 			icon = { color = colors.grey },
-- 			label = { width = 0 },
-- 		})
-- 	end)
-- end)
--
-- spaces_indicator:subscribe("mouse.clicked", function(env)
-- 	sbar.trigger("swap_menus_and_spaces")
-- end)
