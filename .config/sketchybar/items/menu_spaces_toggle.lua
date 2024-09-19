local colors = require("colors")
local icons = require("icons")

sbar.add("event", "swap_menu_and_spaces")

local function switchToggle(menuToggle)
	local isShowingMenu = menuToggle:query().icon.value == icons.switch.on

	menuToggle:set({
		icon = isShowingMenu and icons.switch.off or icons.switch.on,
		label = isShowingMenu and "Menus" or "Spaces",
	})

	sbar.trigger("swap_menu_and_spaces", { isShowingMenu = isShowingMenu })
end

local function addToggle()
	local menuToggle = sbar.add("item", "menu_toggle", {
		icon = {
			string = icons.switch.on,
		},
		label = {
			width = 0,
			color = colors.currentTheme.background,
			string = "Spaces",
		},
		background = {
			color = colors.with_alpha(colors.dirty_white, 0.0),
		},
	})

	sbar.add("item", "menu_toggle" .. ".padding", {
		width = 8,
	})

	menuToggle:subscribe("mouse.entered", function(env)
		sbar.animate("tanh", 30, function()
			menuToggle:set({
				background = {
					color = { alpha = 1.0 },
					border_color = { alpha = 1.0 },
				},
				icon = { color = colors.currentTheme.background },
				label = { width = "dynamic" },
			})
		end)
	end)

	menuToggle:subscribe("mouse.exited", function(env)
		sbar:animate("tanh", 30, function()
			menuToggle:set({
				background = {
					color = { alpha = 0.0 },
					border_color = { alpha = 0.0 },
				},
				icon = { color = colors.currentTheme.text },
				label = { width = 0 },
			})
		end)
	end)

	menuToggle:subscribe("mouse.clicked", function(env)
		switchToggle(menuToggle)
	end)

	menuToggle:subscribe("aerospace_switch", function(env)
		switchToggle(menuToggle)
	end)
end

addToggle()
