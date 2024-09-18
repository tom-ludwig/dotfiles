local colors = require("colors")

local maxItems <const> = 15
local menuItems = {}
local isShowingMenu = false

local frontAppWatcher = sbar.add("item", {
	drawing = false,
	updates = true,
})

local swapWatcher = sbar.add("item", {
	drawing = false,
	updates = true,
})

local function createPlaceholders()
	for index = 1, maxItems, 1 do
		local menu = sbar.add("item", "menu" .. "." .. index, {
			drawing = false,
			icon = { drawing = false },
			width = "dynamic",
			label = {
				font = {
					style = index == 1 and "Bold" or "Regular",
				},
			},
			click_script = "$CONFIG_DIR/bridge/menus/bin/menus -s " .. index,
		})
		menuItems[index] = menu
	end

	sbar.add("bracket", { "/" .. "menu" .. "\\..*/" }, {
		background = {
			color = colors.bg1,
			padding_left = 8,
			padding_right = 8,
		},
	})
end

local function updateMenus()
	sbar.set("/" .. "menu" .. "\\..*/", { drawing = false })

	sbar.exec("$CONFIG_DIR/bridge/menus/bin/menus -l", function(menus)
		local index = 1
		for menu in string.gmatch(menus, "[^\r\n]+") do
			if index < maxItems then
				menuItems[index]:set({
					width = "dynamic",
					label = menu,
					drawing = isShowingMenu,
				})
			else
				break
			end
			index = index + 1
		end
	end)

	sbar.set("menu" .. ".padding", { drawing = isShowingMenu })
end

frontAppWatcher:subscribe("front_app_switched", updateMenus)

swapWatcher:subscribe("swap_menu_and_spaces", function(env)
	isShowingMenu = env.isShowingMenu == "on"
	updateMenus()
end)

createPlaceholders()
