local lushwright = require("shipwright.transform.lush")

-- print(vim.inspect(wombat_classic_256mod))

local function build_colorscheme(theme_name, module_name, ansi_name)
	local theme_module = require("lush_theme." .. module_name).with_ansi(ansi_name)
	run(
		theme_module,
		lushwright.to_vimscript,
		{ append, { "set background=dark", 'let g:colors_name="' .. theme_name .. '"' } },

		-- now we are ready to write our colors file. note: there is no reason this has
		-- to be written to the relative "colors" dir, you could write the file to an
		-- entirely different vim plugin.
		{ overwrite, "colors/" .. theme_name .. ".vim" }
	)
end

build_colorscheme("wombat_classic", "wombat_classic", "256mod")
build_colorscheme("wombat_iterm2", "wombat_lush", "iterm2")
build_colorscheme("wombat_ghostty", "wombat_lush", "ghostty")
build_colorscheme("wombat_lush", "wombat_lush", "256mod")
