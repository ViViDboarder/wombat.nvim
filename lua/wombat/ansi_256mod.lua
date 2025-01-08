-- Define the base color palet for wombat
local lush = require("lush")
local hsl = lush.hsl

-- Modify my lush colors with a few tweaks to match the old 256mod colors
local M = require("wombat.ansi_lush")

M.blue = hsl("#88b8f6")

M.bright_green = hsl("#cae982")

M.foreground = hsl("#e3e0d7")
M.background = hsl("#242424")

return M
