local colors = require("colors")
-- local icons = require("icons")
-- local settings = require("settings")
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
	["4"] = { icon = "󰊻", name = "Communicaiton" },
	["5"] = { icon = "󱃾", name = "Dev Tools" },
	["6"] = { icon = "󰕄", name = "Social Media" },
	["7"] = { icon = "󰝚", name = "Music" },
}

local function selectCurrentWorkspace(focusedWorkspaceName)
	for sid, item in pairs(spaces) do
		if item ~= nil then
			local isSelected = sid == "workspaces" .. "." .. focusedWorkspaceName
			item:set({
				icon = { color = isSelected and colors.currentTheme.background or colors.currentTheme.text },
				label = { color = isSelected and colors.currentTheme.background or colors.currentTheme.text },
				background = { color = isSelected and colors.currentTheme.text or colors.currentTheme.background },
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
			color = colors.currentTheme.text,
		},
		background = {
			color = colors.currentTheme.background,
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
