if vim.g.wombat_ansi_colors_name ~= nil then
	require("wombat").set_colorscheme("wombat", require("lush_theme.wombat_lush"), "iterm2")
else
	vim.cmd("colorscheme wombat_iterm2")
end
