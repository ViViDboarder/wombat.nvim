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
	default_ansi_colors_name = "lush",
}

function M.with_ansi(ansi_colors_name)
	local lush = require("lush")

	local c = require("wombat.colors").from_ansi(ansi_colors_name)
	local classic = require("lush_theme.wombat_classic").with_ansi(ansi_colors_name)

	-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
	-- support an annotation li
	-- luacheck: ignore
	-- @diagnostic disable: undefined-global
	local theme = lush.extends({ classic }).with(function(injected_functions)
		local sym = injected_functions.sym
		return {
			-- Comment(classic.Comment), -- any comment
			-- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
			-- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
			-- Cursor(classic.Cursor), -- character under the cursor
			-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
			-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
			-- CursorColumn(Cursor), -- Screen-column at the cursor, when 'cursorcolumn' is set.
			-- CursorLine(classic.CursorLine), -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
			-- Directory    { }, -- directory names (and other special names in listings)
			DiffAdd({ fg = c.dark_green.readable(), bg = c.dark_green }), -- diff mode: Added line |diff.txt|
			DiffChange({ bg = c.violet }), -- diff mode: Changed line |diff.txt|
			DiffDelete({ fg = c.red.readable(), bg = c.red }), -- diff mode: Deleted line |diff.txt|
			DiffText({ fg = c.magenta.readable(), bg = c.magenta }), -- diff mode: Changed text within a changed line |diff.txt|
			-- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
			-- TermCursor   { }, -- cursor in a focused terminal
			-- TermCursorNC { }, -- cursor in an unfocused terminal
			-- ErrorMsg(classic.ErrorMsg), -- error messages on the command line
			-- VertSplit(classic.VertSplit), -- the column separating vertically split windows
			-- Folded(classic.Folded), -- line used for closed folds
			-- FoldColumn(Folded), -- 'foldcolumn'
			-- SignColumn   { }, -- column where |signs| are displayed
			-- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
			-- Substitute   { }, -- |:substitute| replacement text highlighting
			-- LineNr(classic.LineNr), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
			-- CursorLineNr { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
			-- MatchParen(classic.MatchParen), -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
			-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
			-- MsgArea      { }, -- Area for messages and cmdline
			-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
			-- MoreMsg      { }, -- |more-prompt|
			-- NonText(classic.NonText), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
			Normal({ bg = c.background, fg = c.foreground }), -- normal text
			NormalFloat({ bg = Normal.bg.lighten(10), fg = classic.Special.fg }), -- Normal text in floating windows.
			FloatBorder({ bg = NormalFloat.bg, fg = classic.Pmenu.fg }), -- float border
			-- NormalNC     { }, -- normal text in non-current windows
			-- Pmenu(classic.Pmenu), -- Popup menu: normal item.
			-- PmenuSel(classic.PmenuSel), -- Popup menu: selected item.
			-- PmenuSbar    { }, -- Popup menu: scrollbar.
			-- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
			-- Question     { }, -- |hit-enter| prompt and yes/no questions
			-- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
			-- Search(classic.Search), -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
			-- SpecialKey(classic.SpecialKey), -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
			-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
			-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
			-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
			-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
			-- StatusLine(classic.StatusLine), -- status line of current window
			-- StatusLineNC(classic.StatusLineNC), -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
			-- TabLine      { }, -- tab pages line, not active tab page label
			-- TabLineFill  { }, -- tab pages line, where there are no labels
			-- TabLineSel   { }, -- tab pages line, active tab page label
			-- Title(classic.Title), -- titles for output from ":set all", ":autocmd" etc.
			-- Visual(classic.Visual), -- Visual mode selection
			-- VisualNOS(classic.VisualNOS), -- Visual mode selection when vim is "Not Owning the Selection".
			-- WarningMsg(classic.WarningMsg), -- warning messages
			-- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
			-- WildMenu     { }, -- current match in 'wildmenu' completion

			-- These groups are not listed as default vim groups,
			-- but they are defacto standard group names for syntax highlighting.
			-- commented out groups should chain up to their "preferred" group by
			-- default,
			-- Uncomment and edit if you want more specific syntax highlighting.

			-- Constant(classic.Constant), -- (preferred) any constant
			-- String(classic.String), --   a string constant: "this is a string"
			-- Character      { }, --  a character constant: 'c', '\n'
			-- Number(classic.Number), --   a number constant: 234, 0xff
			Boolean({ fg = c.bright_red }), --  a boolean constant: TRUE, false
			Float(classic.Number), --    a floating point constant: 2.3e10

			-- Identifier(classic.Identifier), -- (preferred) any variable name
			-- Function(classic.Function), -- function name (also: methods for classes)

			-- Statement(classic.Statement), -- (preferred) any statement
			Conditional(classic.Statement), --  if, then, else, endif, switch, etc.
			Repeat(classic.Statement), --   for, do, while, etc.
			Label({ fg = c.magenta }), --    case, default, etc.
			Operator({ fg = c.magenta }), -- "sizeof", "+", "*", etc.
			-- Keyword        { classic.Keyword }, --  any other keyword
			Exception({ fg = c.orange }), --  try, catch, throw

			-- PreProc(classic.PreProc), -- (preferred) generic Preprocessor
			-- Include        { }, --  preprocessor #include
			-- Define         { }, --   preprocessor #define
			-- Macro          { }, --    same as Define
			-- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

			-- Type(classic.Type), -- (preferred) int, long, char, etc.
			-- StorageClass   { }, -- static, register, volatile, etc.
			-- Structure      { }, --  struct, union, enum, etc.
			-- Typedef        { }, --  A typedef

			-- Special(classic.Special), -- (preferred) any special symbol
			-- SpecialChar    { }, --  special character in a constant
			-- Tag            { }, --    you can use CTRL-] on this
			Delimiter({ fg = c.purple }), --  character that needs attention
			-- SpecialComment { }, -- special things inside a comment
			-- Debug          { }, --    debugging statements

			-- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
			-- Bold       { gui = "bold" },
			-- Italic     { gui = "italic" },

			-- ("Ignore", below, may be invisible...)
			-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|
			-- Error          { }, -- (preferred) any erroneous construct
			-- Todo(classic.Todo), -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

			DiagnosticError({ fg = c.dark_orange }),
			DiagnosticWarn({ fg = c.dark_yellow }),
			DiagnosticInfo({ fg = c.dark_green }),
			DiagnosticHint({ fg = c.dark_blue }),

			-- These groups are for the native LSP client. Some other LSP clients may
			-- use these groups, or use their own. Consult your LSP client's
			-- documentation.

			-- LspReferenceText                     { }, -- used for highlighting "text" references
			-- LspReferenceRead                     { }, -- used for highlighting "read" references
			-- LspReferenceWrite                    { }, -- used for highlighting "write" references

			-- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
			-- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
			-- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
			-- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

			-- LspDiagnosticsVirtualTextError({}), -- Used for "Error" diagnostic virtual text
			-- LspDiagnosticsVirtualTextWarning({}), -- Used for "Warning" diagnostic virtual text
			-- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
			-- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

			-- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
			-- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
			-- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
			-- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

			-- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
			-- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
			-- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
			-- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

			-- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
			-- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
			-- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
			-- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

			-- LspCodeLens                          { }, -- Used to color the virtual text of the codelens

			-- These groups are for the neovim tree-sitter highlights.
			-- As of writing, tree-sitter support is a WIP, group names may change.
			-- By default, most of these groups link to an appropriate Vim group,
			-- TSError -> Error for example, so you do not have to define these unless
			-- you explicitly want to support Treesitter's improved syntax awareness.

			-- TSAnnotation         { },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
			-- TSAttribute          { },    -- (unstable) TODO: docs
			-- TSBoolean            { },    -- For booleans.
			-- TSCharacter          { },    -- For characters.
			-- TSComment            { },    -- For comment blocks.
			-- TSConstructor        { },    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
			-- TSConditional        { },    -- For keywords related to conditionnals.
			-- TSConstant           { },    -- For constants
			-- TSConstBuiltin       { },    -- For constant that are built in the language: `nil` in Lua.
			-- TSConstMacro         { },    -- For constants that are defined by macros: `NULL` in C.
			-- TSError              { },    -- For syntax/parser errors.
			-- TSException          { },    -- For exception related keywords.
			-- TSField              { },    -- For fields.
			-- TSFloat              { },    -- For floats.
			TSFunction({ classic.Function }), -- For function (calls and definitions).
			-- TSFuncBuiltin        { },    -- For builtin functions: `table.insert` in Lua.
			-- TSFuncMacro          { },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
			-- TSInclude            { },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
			TSKeyword({ classic.Keyword }), -- For keywords that don't fall in previous categories.
			-- TSKeywordFunction    { },    -- For keywords used to define a fuction.
			-- TSLabel              { },    -- For labels: `label:` in C and `:label:` in Lua.
			TSMethod({ classic.Function }), -- For method calls and definitions.
			-- TSNamespace          { },    -- For identifiers referring to modules and namespaces.
			-- TSNone               { },    -- TODO: docs
			-- TSNumber             { },    -- For all numbers
			-- TSOperator           { },    -- For any operator: `+`, but also `->` and `*` in C.
			-- TSParameter          { },    -- For parameters of a function.
			-- TSParameterReference { },    -- For references to parameters of a function.
			TSProperty({ classic.Identifier }), -- Same as `TSField`.
			-- TSPunctDelimiter     { },    -- For delimiters ie: `.`
			-- TSPunctBracket       { },    -- For brackets and parens.
			-- TSPunctSpecial       { },    -- For special punctutation that does not fall in the catagories before.
			-- TSRepeat             { },    -- For keywords related to loops.
			-- TSString             { },    -- For strings.
			-- TSStringRegex        { },    -- For regexes.
			-- TSStringEscape       { },    -- For escape characters within a string.
			-- TSSymbol             { },    -- For identifiers referring to symbols or atoms.
			TSType({ classic.Type }), -- For types.
			-- TSTypeBuiltin        { },    -- For builtin types.
			TSVariable({ classic.Special }), -- Any variable name that does not have another highlight.
			-- TSVariableBuiltin    { },    -- Variable names that are defined by the languages, like `this` or `self`.

			-- TSTag                { },    -- Tags like html tag names.
			-- TSTagDelimiter       { },    -- Tag delimiter like `<` `>` `/`
			TSText({ fg = Normal.fg }), -- For strings considered text in a markup language.
			-- TSEmphasis           { },    -- For text to be represented with emphasis.
			-- TSUnderline          { },    -- For text to be represented with an underline.
			-- TSStrike             { },    -- For strikethrough text.
			-- TSTitle              { },    -- Text that is part of a title.
			-- TSLiteral            { },    -- Literal text.
			-- TSURI                { },    -- Any URI like a link or email.

			-- Link all uncommented TS values to their semantic equivalents
			sym("@function")({ TSFunction }),
			sym("@keyword")({ TSKeyword }),
			sym("@method")({ TSMethod }),
			sym("@property")({ TSProperty }),
			sym("@type")({ TSType }),
			sym("@variable")({ TSVariable }),
			sym("@text")({ TSText }),

			-- cmp highlights
			CmpItemAbbrDeprecated({ fg = c.bright_green, gui = "strikethrough" }),
			CmpItemAbbrMatch({ fg = c.bright_green }),
			CmpItemAbbrMatchFuzzy({ CmpItemAbbrMatch }),
			CmpItemKindVariable({ TSVariable }),
			CmpItemKindInterface({ TSType }),
			CmpItemKindText({ TSText }),
			CmpItemKindFunction({ TSFunction }),
			CmpItemKindMethod({ TSMethod }),
			CmpItemKindKeyword({ TSKeyword }),
			CmpItemKindProperty({ TSProperty }),
			CmpItemKindUnit({ Normal }),

			-- lualine
			lualine_a_command({ bg = c.green, fg = c.grey_5, gui = "bold" }), -- lualine_a_visual xxx gui=bold guifg=#444444 guibg=#f2c68a
			lualine_a_inactive({ bg = c.grey_5, fg = c.white, gui = "bold" }), -- lualine_a_inactive xxx gui=bold guifg=#969696 guibg=#444444
			lualine_a_insert({ bg = c.blue, fg = c.grey_5, gui = "bold" }), -- lualine_a_insert xxx gui=bold guifg=#444444 guibg=#95e454
			lualine_a_normal({ bg = c.green, fg = c.grey_5, gui = "bold" }), -- lualine_a_normal xxx gui=bold guifg=#444444 guibg=#8ac6f2
			lualine_a_replace({ bg = c.orange, fg = "#353535", gui = "bold" }), -- lualine_a_replace xxx gui=bold guifg=#353535 guibg=#e5786d
			lualine_a_terminal({ bg = c.green, fg = "#353535", gui = "bold" }), -- lualine_a_replace xxx gui=bold guifg=#353535 guibg=#e5786d
			lualine_a_visual({ bg = c.dark_yellow, fg = c.grey_5, gui = "bold" }), -- lualine_a_visual xxx gui=bold guifg=#444444 guibg=#f2c68a

			lualine_b_diff_added_command({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_added_command xxx guifg=#000000 guibg=#808080
			lualine_b_diff_added_inactive({ bg = "#585858", fg = "#000000" }), -- lualine_b_diff_added_inactive xxx guifg=#000000 guibg=#585858
			lualine_b_diff_added_insert({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_added_insert xxx guifg=#000000 guibg=#808080
			lualine_b_diff_added_normal({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_added_normal xxx guifg=#000000 guibg=#808080
			lualine_b_diff_added_replace({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_added_replace xxx guifg=#000000 guibg=#808080
			lualine_b_diff_added_terminal({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_added_terminal xxx guifg=#000000 guibg=#808080
			lualine_b_diff_added_visual({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_added_visual xxx guifg=#000000 guibg=#808080
			lualine_b_diff_modified_command({ bg = "#808080", fg = "#f0e130" }), -- lualine_b_diff_modified_command xxx guifg=#f0e130 guibg=#808080
			lualine_b_diff_modified_inactive({ bg = "#585858", fg = "#f0e130" }), -- lualine_b_diff_modified_inactive xxx guifg=#f0e130 guibg=#585858
			lualine_b_diff_modified_insert({ bg = "#808080", fg = "#f0e130" }), -- lualine_b_diff_modified_insert xxx guifg=#f0e130 guibg=#808080
			lualine_b_diff_modified_normal({ bg = "#808080", fg = "#f0e130" }), -- lualine_b_diff_modified_normal xxx guifg=#f0e130 guibg=#808080
			lualine_b_diff_modified_replace({ bg = "#808080", fg = "#f0e130" }), -- lualine_b_diff_modified_replace xxx guifg=#f0e130 guibg=#808080
			lualine_b_diff_modified_terminal({ bg = "#808080", fg = "#f0e130" }), -- lualine_b_diff_modified_terminal xxx guifg=#f0e130 guibg=#808080
			lualine_b_diff_modified_visual({ bg = "#808080", fg = "#f0e130" }), -- lualine_b_diff_modified_visual xxx guifg=#f0e130 guibg=#808080
			lualine_b_diff_removed_command({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_removed_command xxx guifg=#000000 guibg=#808080
			lualine_b_diff_removed_inactive({ bg = "#585858", fg = "#000000" }), -- lualine_b_diff_removed_inactive xxx guifg=#000000 guibg=#585858
			lualine_b_diff_removed_insert({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_removed_insert xxx guifg=#000000 guibg=#808080
			lualine_b_diff_removed_normal({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_removed_normal xxx guifg=#000000 guibg=#808080
			lualine_b_diff_removed_replace({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_removed_replace xxx guifg=#000000 guibg=#808080
			lualine_b_diff_removed_terminal({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_removed_terminal xxx guifg=#000000 guibg=#808080
			lualine_b_diff_removed_visual({ bg = "#808080", fg = "#000000" }), -- lualine_b_diff_removed_visual xxx guifg=#000000 guibg=#808080
			lualine_b_inactive({ bg = "#585858", fg = "#353535" }), -- lualine_b_inactive xxx guifg=#353535 guibg=#585858
			lualine_b_normal({ bg = "#808080", fg = "#444444" }), -- lualine_b_normal xxx guifg=#444444 guibg=#808080

			lualine_c_inactive({ bg = "#353535", fg = "#969696" }), -- lualine_c_inactive xxx guifg=#969696 guibg=#353535
			lualine_c_normal({ bg = "#444444", fg = "#a8a8a8" }), -- lualine_c_normal xxx guifg=#a8a8a8 guibg=#444444

			lualine_z({ bg = c.red, fg = c.grey_5 }),
			lualine_z_12_command(lualine_z), -- lualine_z_12_command xxx guifg=#444444 guibg=#de4f1f
			lualine_z_12_inactive(lualine_z), -- lualine_z_12_inactive xxx guifg=#969696 guibg=#de4f1f
			lualine_z_12_insert(lualine_z), -- lualine_z_12_insert xxx guifg=#444444 guibg=#de4f1f
			lualine_z_12_normal(lualine_z), -- lualine_z_12_normal xxx guifg=#444444 guibg=#de4f1f
			lualine_z_12_replace(lualine_z), -- lualine_z_12_replace xxx guifg=#353535 guibg=#de4f1f
			lualine_z_12_terminal(lualine_z), -- lualine_z_12_terminal xxx guifg=#444444 guibg=#de4f1f
			lualine_z_12_visual(lualine_z), -- lualine_z_12_visual xxx guifg=#444444 guibg=#de4f1f
			lualine_z_13_command(lualine_z), -- lualine_z_13_command xxx guifg=#444444 guibg=#de4f1f
			lualine_z_13_inactive(lualine_z), -- lualine_z_13_inactive xxx guifg=#969696 guibg=#de4f1f
			lualine_z_13_insert(lualine_z), -- lualine_z_13_insert xxx guifg=#444444 guibg=#de4f1f
			lualine_z_13_normal(lualine_z), -- lualine_z_13_normal xxx guifg=#444444 guibg=#de4f1f
			lualine_z_13_replace(lualine_z), -- lualine_z_13_replace xxx guifg=#353535 guibg=#de4f1f
			lualine_z_13_terminal(lualine_z), -- lualine_z_13_terminal xxx guifg=#444444 guibg=#de4f1f
			lualine_z_13_visual(lualine_z), -- lualine_z_13_visual xxx guifg=#444444 guibg=#de4f1f

			lualine_z_diagnostics_error_command({ bg = lualine_a_command.bg, fg = "#590008" }), -- lualine_z_diagnostics_error_command xxx guifg=#590008 guibg=#8ac6f2
			lualine_z_diagnostics_error_inactive({ bg = lualine_a_inactive.bg, fg = "#590008" }), -- lualine_z_diagnostics_error_inactive xxx guifg=#590008 guibg=#444444
			lualine_z_diagnostics_error_insert({ bg = lualine_a_insert.bg, fg = "#590008" }), -- lualine_z_diagnostics_error_insert xxx guifg=#590008 guibg=#95e454
			lualine_z_diagnostics_error_normal({ bg = lualine_a_normal.bg, fg = "#590008" }), -- lualine_z_diagnostics_error_normal xxx guifg=#590008 guibg=#8ac6f2
			lualine_z_diagnostics_error_replace({ bg = lualine_a_replace.bg, fg = "#590008" }), -- lualine_z_diagnostics_error_replace xxx guifg=#590008 guibg=#e5786d
			lualine_z_diagnostics_error_terminal({ bg = lualine_a_terminal.bg, fg = "#590008" }), -- lualine_z_diagnostics_error_terminal xxx guifg=#590008 guibg=#8ac6f2
			lualine_z_diagnostics_error_visual({ bg = lualine_a_visual.bg, fg = "#590008" }), -- lualine_z_diagnostics_error_visual xxx guifg=#590008 guibg=#f2c68a

			lualine_z_diagnostics_hint_command({ bg = "#8ac6f2", fg = "#004c73" }), -- lualine_z_diagnostics_hint_command xxx guifg=#004c73 guibg=#8ac6f2
			lualine_z_diagnostics_hint_inactive({ bg = "#444444", fg = "#004c73" }), -- lualine_z_diagnostics_hint_inactive xxx guifg=#004c73 guibg=#444444
			lualine_z_diagnostics_hint_insert({ bg = "#95e454", fg = "#004c73" }), -- lualine_z_diagnostics_hint_insert xxx guifg=#004c73 guibg=#95e454
			lualine_z_diagnostics_hint_normal({ bg = "#8ac6f2", fg = "#004c73" }), -- lualine_z_diagnostics_hint_normal xxx guifg=#004c73 guibg=#8ac6f2
			lualine_z_diagnostics_hint_replace({ bg = "#e5786d", fg = "#004c73" }), -- lualine_z_diagnostics_hint_replace xxx guifg=#004c73 guibg=#e5786d
			lualine_z_diagnostics_hint_terminal({ bg = "#8ac6f2", fg = "#004c73" }), -- lualine_z_diagnostics_hint_terminal xxx guifg=#004c73 guibg=#8ac6f2
			lualine_z_diagnostics_hint_visual({ bg = "#f2c68a", fg = "#004c73" }), -- lualine_z_diagnostics_hint_visual xxx guifg=#004c73 guibg=#f2c68a
			lualine_z_diagnostics_info_command({ bg = "#8ac6f2", fg = "#007373" }), -- lualine_z_diagnostics_info_command xxx guifg=#007373 guibg=#8ac6f2
			lualine_z_diagnostics_info_inactive({ bg = "#444444", fg = "#007373" }), -- lualine_z_diagnostics_info_inactive xxx guifg=#007373 guibg=#444444
			lualine_z_diagnostics_info_insert({ bg = "#95e454", fg = "#007373" }), -- lualine_z_diagnostics_info_insert xxx guifg=#007373 guibg=#95e454
			lualine_z_diagnostics_info_normal({ bg = "#8ac6f2", fg = "#007373" }), -- lualine_z_diagnostics_info_normal xxx guifg=#007373 guibg=#8ac6f2
			lualine_z_diagnostics_info_replace({ bg = "#e5786d", fg = "#007373" }), -- lualine_z_diagnostics_info_replace xxx guifg=#007373 guibg=#e5786d
			lualine_z_diagnostics_info_terminal({ bg = "#8ac6f2", fg = "#007373" }), -- lualine_z_diagnostics_info_terminal xxx guifg=#007373 guibg=#8ac6f2
			lualine_z_diagnostics_info_visual({ bg = "#f2c68a", fg = "#007373" }), -- lualine_z_diagnostics_info_visual xxx guifg=#007373 guibg=#f2c68a
			lualine_z_diagnostics_warn_command({ bg = "#8ac6f2", fg = "#6b5300" }), -- lualine_z_diagnostics_warn_command xxx guifg=#6b5300 guibg=#8ac6f2
			lualine_z_diagnostics_warn_inactive({ bg = "#444444", fg = "#6b5300" }), -- lualine_z_diagnostics_warn_inactive xxx guifg=#6b5300 guibg=#444444
			lualine_z_diagnostics_warn_insert({ bg = "#95e454", fg = "#6b5300" }), -- lualine_z_diagnostics_warn_insert xxx guifg=#6b5300 guibg=#95e454
			lualine_z_diagnostics_warn_normal({ bg = "#8ac6f2", fg = "#6b5300" }), -- lualine_z_diagnostics_warn_normal xxx guifg=#6b5300 guibg=#8ac6f2
			lualine_z_diagnostics_warn_replace({ bg = "#e5786d", fg = "#6b5300" }), -- lualine_z_diagnostics_warn_replace xxx guifg=#6b5300 guibg=#e5786d
			lualine_z_diagnostics_warn_terminal({ bg = "#8ac6f2", fg = "#6b5300" }), -- lualine_z_diagnostics_warn_terminal xxx guifg=#6b5300 guibg=#8ac6f2
			lualine_z_diagnostics_warn_visual({ bg = "#f2c68a", fg = "#6b5300" }), -- lualine_z_diagnostics_warn_visual xxx guifg=#6b5300 guibg=#f2c68a

			-- Indent Blank Line (ibl)
			IblIndent({ fg = c.grey_4 }), -- Highlight for indentation characters
			IblWhitespace({ IblIndent }), -- Highlight for whitespace characters
			IblScope({ fg = c.dark_orange }), -- Highlight for scope characters
		}
	end)

	-- return our parsed theme for extension or use else where.
	return theme
end

return M

-- vi:nowrap
