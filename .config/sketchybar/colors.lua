local themes = {
	default = {
		text = 0xffe2e2e3,
		background = 0xff363944,
		outline = 0xff414550,
		critical = 0xfffc5d7c, -- Hex value for red
		warning = 0xfff39660, -- Hex value for orange
		success = 0xff9ed072, -- Hex value for green
		primary = 0xff76cce0, -- Hex value for blue
	},
	ocean = {
		text = 0xffe2e2e3,
		background = 0xff167c9e, -- Hex value for dark blue
		outline = 0xff113752, -- Hex value for darker blue
		critical = 0xffd1495b, -- Hex value for red
		warning = 0xfff2994a, -- Hex value for orange
		success = 0xff70c7a9, -- Hex value for green
		primary = 0xff8eb2c3, -- Hex value for light blue
	},
	cappuccino = {
		text = 0xff5d4037, -- Hex value for dark brown
		background = 0xffe6d4d1, -- Hex value for light pink
		outline = 0xff8e8c89, -- Hex value for gray
		critical = 0xff9b6f73, -- Hex value for reddish brown
		warning = 0xffb3949f, -- Hex value for light brown
		success = 0xffc7bba7, -- Hex value for beige
		primary = 0xffad9b92, -- Hex value for dark beige
	},
	catppuccin_latte = {
		text = 0xff5d4037,
		background = 0xffe6d4d1,
		outline = 0xff8e8c89,
		critical = 0xff9b6f73,
		warning = 0xffb3949f,
		success = 0xffc7bba7,
		primary = 0xffad9b92,
	},
	catppuccin_mocha_dark = {
		text = 0xfff5e0dc,
		background = 0xff1e1e2e,
		outline = 0xff11111b,
		critical = 0xfff38ba8,
		warning = 0xfffab387,
		success = 0xffa6e3a1,
		primary = 0xff74c7ec,
	},
	catppuccin_mocha_green = {
		text = 0xffa6e3a1,
		background = 0xff1e1e2e,
		outline = 0xff94e2d5,
		critical = 0xfff38ba8,
		warning = 0xfffab387,
		success = 0xffa6e3a1,
		primary = 0xff74c7ec,
	},
	-- TODO: Finish color scheme
	catppuccin_mocha_purple = {
		text = 0xffa6e3a1,
		background = 0xff1e1e2e,
		outline = 0xff94e2d5,
		critical = 0xfff38ba8,
		warning = 0xfffab387,
		success = 0xffa6e3a1,
		primary = 0xff74c7ec,
	},
}

local colors = {
	currentTheme = themes.default,
	black = 0xff181819,
	white = 0xffe2e2e3,
	red = 0xfffc5d7c,
	green = 0xff9ed072,
	blue = 0xff76cce0,
	yellow = 0xffe7c664,
	orange = 0xfff39660,
	magenta = 0xffb39df3,
	grey = 0xff7f8490,
	transparent = 0x00000000,

	bar = {
		bg = 0xf02c2e34,
		border = 0xff2c2e34,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	bg1 = 0xff363944,
	bg2 = 0xff414550,

	with_alpha = function(color, alpha)
		return color
		-- if alpha > 1.0 or alpha < 0.0 then
		-- 	return color
		-- end
		-- return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}

return colors
