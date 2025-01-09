local M = {}

function M.setup(opts)
	M.ansi_colors_name = opts["ansi_colors_name"]
end

function M.set_colorscheme(colors_name, theme_module, default_ansi_colors_name)
	vim.g.colors_name = colors_name

	package.loaded["lush_theme.lush_template"] = nil

	-- Use the ansi colors that the user sets on setup, or use the default
	local ansi_colors_name = (M.ansi_colors_name or default_ansi_colors_name or theme_module.default_ansi_colors_name)

	require("lush")(theme_module.with_ansi(ansi_colors_name))
end

return M
