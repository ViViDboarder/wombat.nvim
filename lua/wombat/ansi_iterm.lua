-- Define the base color palet for wombat
local lush = require("lush")
local hsl = lush.hsl

local M = {}

-- ANSI terminal colors
M.black = hsl("#000000")
M.red = hsl("#ff615a")
M.green = hsl("#b1e969")
M.yellow = hsl("#ebd99c")
M.blue = hsl("#5da9f6")
M.magenta = hsl("#e86aff")
M.cyan = hsl("#82fff7")
M.white = hsl("#dedacf")

M.bright_black = hsl("#313131")
M.bright_red = hsl("#f58c80")
M.bright_green = hsl("#ddf88f")
M.bright_yellow = hsl("#eee5b2")
M.bright_blue = hsl("#a5c7ff")
M.bright_magenta = hsl("#ddaaff")
M.bright_cyan = hsl("#b7fff9")
M.bright_white = hsl("#ffffff")

M.foreground = hsl("#dedacf")
M.background = hsl("#171717")

M.cursor = hsl("#bbbbbb")
M.cursor_text = hsl("#ffffff")

M.selection_background = hsl("#453b39")
M.selection_foreground = hsl("#b6bbc0")

return M
