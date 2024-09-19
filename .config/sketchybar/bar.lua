local colors = require("colors")

-- Equivalent to the --bar domain
-- sbar.bar({
--   topmost = "window",
--   height = 40,
--   color = colors.bar.bg,
--   padding_right = 2,
--   padding_left = 2,
-- })

sbar.bar({
	topmost = "window",
	height = 36,
	color = colors.dark_grey, -- TODO: Toggle Background color in the theme.
	padding_right = 12,
	padding_left = 12,
	margin = 12,
	corner_radius = 8,
	y_offset = 8,
	-- blur_radius = 30,
	border_width = 0,
})
