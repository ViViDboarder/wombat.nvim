-- Define the base color palet for wombat
local M = {}

function M.from_ansi(ansi_colors_name)
	local lush = require("lush")
	local hsl = lush.hsl

	local c_step = 20

	local ansi_colors = require("wombat." .. ansi_colors_name)
	local c = ansi_colors

	-- Add dark color variants not in pallet
	c.dark_black = c.black.darken(c_step)
	c.dark_red = c.red.darken(c_step)
	c.dark_green = c.green.darken(c_step)
	c.dark_yellow = c.yellow.darken(c_step)
	c.dark_blue = c.blue.darken(c_step)
	c.dark_magenta = c.magenta.darken(c_step)
	c.dark_cyan = c.cyan.darken(c_step)
	c.dark_white = c.white.darken(c_step)

	-- Extend pallet colors
	-- TODO: See if these should be replaced with the ANSI terminal colors
	c.orange = hsl("#e5786d")
	c.dark_orange = c.orange.darken(c_step)
	c.violet = hsl("#b294bb")
	c.purple = hsl("#d787ff")
	c.grey = hsl("#574b49")
	c.aqua = c.cyan
	c.pink = c.bright_red.lighten(c_step)

	-- A few grey scales
	c.grey_1 = hsl("#c3c6ca")
	c.grey_2 = hsl("#9c998e")
	c.grey_3 = hsl("#636066")
	c.grey_4 = hsl("#574b49")
	c.grey_5 = hsl("#444444")
	c.grey_6 = hsl("#32322f")

	-- Other colors
	c.error_red = hsl("#ff2026")

	return c
end

return M
