# Wombat Lush

Based on wombat256mod and the iTerm 2 Wombat colors.

Created with [Lush](http://git.io/lush.nvim)

![Screenshot](https://user-images.githubusercontent.com/137025/138964572-88d52e78-c971-4e69-8d4f-65b5fa245e51.png)
## Included colorschemes

### wombat

A compiled colorscheme based on the iTerm2 Wombat colorscheme with support for newer Neovim highlights.

### wombat_iterm2

A duplicate of wombat specifying the ansi colors

### wombat_ghostty

A compiled colorscheme based on the Ghostty Wombat colorscheme with support for newer Neovim highlights.

### wombat_classic

A compiled colorscheme based on the original wombat256mod colorscheme. This does not have highlights for newer Neovim features.

### wombat_lush

A slight departure from the wombat256mod colorscheme, but with extended support for newer Neovim features. This is a lua based theme that is dynamically generated. It will allow custom ansi colors as described below in the configuration section.

## Installation

### With vim.pack

If you are using a compiled theme, you need no dependencies or configuration.

```lua
vim.pack.add({
    "https://github.com/ViViDboarder/wombat.nvim",
})
colorscheme wombat
```

If you want to dynamically set ansi colors, you use the example below.

```lua
vim.pack.add({
    "https://github.com/ViViDboarder/wombat.nvim",
    "https://github.com/rktjmp/lush.nvim",
})
-- You can optionally specify the name of the ansi colors you wish to use
-- This defaults to nil and will use the default ansi colors for the theme
vim.g.wombat_ansi_colors_name = nil
vim.cmd("colorscheme wombat_lush")
```

### With lazy.nvim

```lua
{
    "ViViDboarder/wombat.nvim",
    dependencies = { { "rktjmp/lush.nvim" } }, -- optional. Only required for wombat_lush and dynamic ansi colors
    opts = {
        -- You can optionally specify the name of the ansi colors you wish to use
        -- This defaults to nil and will use the default ansi colors for the theme
        ansi_colors_name = nil,
    },
}
```

## Configuration

If you are not using dynamic ansi colors, there is no configuration necessary. If you choose to use dynamic colors, you must have lush.nvim installed (see installation above).

You can overide the base ANSI color schemes to match your terminal by selecting an alternative scheme when setting up the module or by setting `vim.g.wombat_ansi_colors_name`.

```lua
require('wombat').setup({
    ansi_colors_name = "ghostty",
})
```

## Setting the theme in Lua

You can set the theme using any combination of theme file and ansi colors using the lua command:

```lua
require("wombat").set_colorschme("theme_name", require("lush_theme.wombat_lush"), "ghostty")
```

This may be useful to you if you want to extend the team to be based on more percise ansi colors matching your terminal.

## Extending ansi colors

If you are using a terminal colorsceme based on Wombat and would like your colors to match more percisely, you can define a new set of ansi colors in a lua file similar to the one shown in `lua/wombat/ansi_iterm2.lua`. It should be in a path `lua/wombat/ansi_new_theme.lua`.

You can then set this as the default ansi colors by setting the `ansi_colors_name` in the setup function shown above.

If you want to be able to set this via `:colorscheme`, you can create a new colorscheme file similar to `colors/wombat_lush.lua`, but reference the new file name instead of `lush`.
