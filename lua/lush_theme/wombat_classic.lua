--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local M = {
	default_ansi_colors_name = "256mod",
}

function M.with_ansi(ansi_colors_name)
	local lush = require("lush")
	local hsl = lush.hsl

	local c = require("wombat.colors").from_ansi(ansi_colors_name)
	-- Import 256mod colors because we always use that background in classic
	local c256mod = require("wombat.colors").from_ansi("256mod")
	local italic = "italic"

	-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
	-- support an annotation like the following. Consult your server documentation.
	-- -@diagnostic disable: undefined-global
	local theme = lush(function()
		return {
			Comment({ fg = c.grey_2, gui = italic }), -- any comment
			Cursor({ bg = c.yellow }), -- character under the cursor
			CursorColumn({ Cursor }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
			CursorLine({ bg = c.grey_6 }), -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
			Directory({ fg = c.cyan }), -- directory names (and other special names in listings)
			DiffAdd({ bg = hsl("#2a0d6a") }), -- diff mode: Added line |diff.txt|
			DiffChange({ bg = hsl("#382a37") }), -- diff mode: Changed line |diff.txt|
			DiffDelete({ fg = hsl("#242424"), bg = hsl("#3e3969") }), -- diff mode: Deleted line |diff.txt|
			DiffText({ bg = hsl("#382a37") }), -- diff mode: Changed text within a changed line |diff.txt|
			ErrorMsg({ fg = c.error_red, bg = c.grey_5, gui = "bold" }), -- error messages on the command line
			VertSplit({ fg = c.grey_5, bg = c.grey_5 }), -- the column separating vertically split windows
			Folded({ fg = c.grey_2, bg = c.grey_4 }), -- line used for closed folds
			FoldColumn({ Folded }), -- 'foldcolumn'
			LineNr({ fg = c.grey_4, bg = c.black }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
			MatchParen({ fg = c.yellow, bg = c.grey_2, gui = "bold" }), -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
			NonText({ LineNr }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
			Normal({ bg = c256mod.background, fg = c256mod.foreground }), -- normal text
			Pmenu({ fg = c.bright_yellow, bg = c.grey_5 }), -- Popup menu: normal item.
			PmenuSel({ fg = c.bright_green.readable(), bg = c.bright_green }), -- Popup menu: selected item.
			Search({ fg = c.purple, bg = c.grey_3 }), -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
			SpecialKey({ fg = c.grey_3, bg = c.grey_6 }), -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
			StatusLine({ fg = c.bright_yellow, bg = c.grey_5, gui = italic }), -- status line of current window
			StatusLineNC({ fg = c.grey_2, bg = StatusLine.bg }), -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
			Title({ fg = c.bright_yellow, gui = "bold" }), -- titles for output from ":set all", ":autocmd" etc.
			Visual({ fg = c.grey_1, bg = c.grey_4 }), -- Visual mode selection
			VisualNOS({ fg = c.grey_1, bg = c.grey_5 }), -- Visual mode selection when vim is "Not Owning the Selection".
			WarningMsg({ fg = c.bright_red }), -- warning messages
			Constant({ fg = c.orange }), -- (preferred) any constant
			String({ fg = c.green, gui = italic }), --   a string constant: "this is a string"
			Number({ fg = c.orange }), --   a number constant: 234, 0xff
			Identifier({ fg = c.bright_green }), -- (preferred) any variable name
			Function({ fg = c.bright_green }), -- function name (also: methods for classes)
			Statement({ fg = c.blue }), -- (preferred) any statement
			Keyword({ fg = c.blue }), --  any other keyword
			PreProc({ fg = c.orange }), -- (preferred) generic Preprocessor
			Type({ fg = c.yellow }), -- (preferred) int, long, char, etc.
			Special({ fg = c.yellow }), -- (preferred) any special symbol
			Todo({ fg = c.grey_3, gui = italic }), -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		}
	end)

	-- return our parsed theme for extension or use else where.
	return theme
end

return M
-- vi:nowrap
