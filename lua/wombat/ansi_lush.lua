-- Define the base color palet for wombat
local lush = require("lush")
local hsl = lush.hsl

local c_step = 20

local M = {}

M.black = hsl("#000000")
M.red = hsl("#ff786c").darken(c_step)
M.green = hsl("#95e454")
M.yellow = hsl("#efdeab")
M.blue = hsl("#6eb9f8") -- 256mod #88b8f6
M.magenta = hsl("#ee87ff")
M.cyan = hsl("#90fdf8")
M.white = hsl("#e4e0d7")

M.bright_black = hsl("#313131")
M.bright_red = hsl("#ff786c")
M.bright_green = hsl("#bde97c") -- 256mod #cae982
M.bright_yellow = hsl("#ffffd7")
M.bright_blue = M.blue.lighten(c_step)
M.bright_magenta = M.magenta.lighten(c_step)
M.bright_cyan = M.cyan.lighten(c_step)
M.bright_white = hsl("#ffffff")

-- Set some fg/bg colors
M.foreground = hsl("#e4e0d7")
M.background = hsl("#1e1e1e")

M.cursor = hsl("#bbbbbb")
M.cursor_text = hsl("#ffffff")

M.selection_background = hsl("#574b49")
M.selection_foreground = hsl("#c3c6ca")

return M
