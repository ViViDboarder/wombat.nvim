-- Define the base color palet for wombat
local lush = require('lush')
local hsl = lush.hsl

local c_step = 20

local M = {
    italic = "italic",
    colors = {},
}

local c = M.colors

c.black = hsl("#000000")
c.red = hsl("#ff786c")
c.darkred = c.red.darken(c_step)
c.green = hsl("#bde97c") -- 256mod #cae982
c.bright_green = hsl("#95e454")
c.darkgreen = c.green.darken(c_step)
c.yellow = hsl("#efdeab")
c.light_yellow = hsl("#ffffd7")
c.darkyellow = c.yellow.darken(c_step)
c.blue = hsl("#6eb9f8") -- 256mod #88b8f6
c.darkblue = c.blue.darken(c_step)
c.magenta = hsl("#ee87ff")
c.darkmagenta = c.magenta.darken(c_step)
c.cyan = hsl("#90fdf8")
c.darkcyan = c.cyan.darken(c_step)
c.white = hsl("#e4e0d7")

c.orange = hsl("#e5786d")
c.darkorange = c.orange.darken(c_step)
c.purple = hsl("#d787ff")
c.violet = hsl("#b294bb")
c.grey = hsl("#574b49")
c.aqua = c.cyan
c.pink = c.red.lighten(c_step)

-- A few grey scales
c.grey_1 = hsl("#c3c6ca")
c.grey_2 = hsl("#9c998e")
c.grey_3 = hsl("#636066")
c.grey_4 = hsl("#574b49")
c.grey_5 = hsl("#444444")
c.grey_6 = hsl("#32322f")

-- Other colors
c.error_red = hsl("#ff2026")

-- Set some fg/bg colors
c.dark_fg = hsl("#e4e0d7")
c.dark_bg = hsl("#1e1e1e")
c.dark_fg_256mod = hsl("#e3e0d7")
c.dark_bg_256mod = hsl("#242424")

return M
