# Wombat Lush

Based on wombat256mod and the iTerm 2 Wombat colors.

Created with [Lush](http://git.io/lush.nvim)

![Screenshot](https://user-images.githubusercontent.com/137025/138964572-88d52e78-c971-4e69-8d4f-65b5fa245e51.png)
## Included colorschemes

### wombat

A colorscheme based on the iTerm2 Wombat colorscheme with support for newer Neovim highlights.

### wombat_classic

A colorscheme based on the original wombat256mod colorscheme. This does not have highlights for newer Neovim features.

### wombat_lush

A slight departure from the wombat256mod colorscheme, but with extended support for newer Neovim features.

## Installation

### With Packer

```lua
use {
    "ViViDboarder/wombat.nvim",
    requires = "rktjmp/lush.nvim",
}
```

### With lazy.nvim

```lua
{
    "ViViDboarder/wombat.nvim",
    dependencies = { { "rktjmp/lush.nvim" } },
    opts = {
        -- You can optionally specify the name of the ansi colors you wish to use
        -- This defaults to nil and will use the default ansi colors for the theme
        ansi_colors_name = nil,
    },
}
```

## Configuration

You can overide the base ANSI color schemes to match your terminal by selecting an alternative scheme when setting up the module.

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

If you want to be able to set this via `:colorscheme`, you can create a new colorscheme file similar to `colors/wombat.vim`, but reference the new file name instead of `iterm2`.
