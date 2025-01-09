-- ANSI scheme from iTerm2-Color-Schemes as converted to hex
-- NOTE: This does not actually represent what iTerm2 shows
-- but rather what is shown here:
--		https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/ghostty/Wombat
local lush = require("lush")
local hsl = lush.hsl

-- ANSI terminal colors
return {
	black = hsl("#000000"),
	red = hsl("#ff615a"),
	green = hsl("#b1e969"),
	yellow = hsl("#ebd99c"),
	blue = hsl("#5da9f6"),
	magenta = hsl("#e86aff"),
	cyan = hsl("#82fff7"),
	white = hsl("#dedacf"),

	bright_black = hsl("#313131"),
	bright_red = hsl("#f58c80"),
	bright_green = hsl("#ddf88f"),
	bright_yellow = hsl("#eee5b2"),
	bright_blue = hsl("#a5c7ff"),
	bright_magenta = hsl("#ddaaff"),
	bright_cyan = hsl("#b7fff9"),
	bright_white = hsl("#ffffff"),

	foreground = hsl("#dedacf"),
	background = hsl("#171717"),

	cursor = hsl("#bbbbbb"),
	cursor_text = hsl("#ffffff"),

	selection_background = hsl("#453b39"),
	selection_foreground = hsl("#b6bbc0"),
}
