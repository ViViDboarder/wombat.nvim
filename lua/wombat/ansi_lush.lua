-- Define the base color pallet for wombat
local lush = require("lush")
local hsl = lush.hsl

local c_step = 20

return {
	black = hsl("#000000"),
	red = hsl("#ff786c").darken(c_step),
	green = hsl("#95e454"),
	yellow = hsl("#efdeab"),
	blue = hsl("#6eb9f8"),
	magenta = hsl("#ee87ff"),
	cyan = hsl("#90fdf8"),
	white = hsl("#e4e0d7"),

	bright_black = hsl("#313131"),
	bright_red = hsl("#ff786c"),
	bright_green = hsl("#bde97c"),
	bright_yellow = hsl("#ffffd7"),
	bright_blue = hsl("#6eb9f8").lighten(c_step),
	bright_magenta = hsl("#ee87ff").lighten(c_step),
	bright_cyan = hsl("#90fdf8").lighten(c_step),
	bright_white = hsl("#ffffff"),

	foreground = hsl("#e4e0d7"),
	background = hsl("#1e1e1e"),

	cursor = hsl("#bbbbbb"),
	cursor_text = hsl("#ffffff"),

	selection_background = hsl("#574b49"),
	selection_foreground = hsl("#c3c6ca"),
}
