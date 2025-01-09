-- ANSI scheme using hex values pulled from iTerm2's Wombat theme
local lush = require("lush")
local hsl = lush.hsl

-- ANSI terminal colors
return {
	black = hsl("#000000"),
	red = hsl("#f08072"),
	green = hsl("#c6e889"),
	yellow = hsl("#ecdfb1"),
	blue = hsl("#7fb7f2"),
	magenta = hsl("#e08cf8"),
	cyan = hsl("#aafaf7"),
	white = hsl("#e4e1d8"),

	bright_black = hsl("#404040"),
	bright_red = hsl("#eca395"),
	bright_green = hsl("#e6f6a9"),
	bright_yellow = hsl("#f0e9c3"),
	bright_blue = hsl("#b9d1fb"),
	bright_magenta = hsl("#debefa"),
	bright_cyan = hsl("#cefcf9"),
	bright_white = hsl("#fefefe"),

	foreground = hsl("#e4e1d8"),
	background = hsl("#1e1e1e"),

	cursor = hsl("#c7c7c7"),
	cursor_text = hsl("#feffff"),

	selection_background = hsl("#554c49"),
	selection_foreground = hsl("#c3c7ca"),
}
