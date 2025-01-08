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

A colorscheme based on the original wombat256mod colorscheme, but with extended support for newer Neovim features.

## Installation

### With Packer

    use {
        "ViViDboarder/wombat.nvim",
        requires = "rktjmp/lush.nvim",
    }

## Extending

If you are using a terminal colorsceme based on Wombat and would like your colors to match more percisely, you can define a new set of ansi colors in a lua file similar to the one shown in `lua/wombat/ansi_iterm.lua'. It should be in a path `lua/wombat/ansi_new_theme.lua`.

Then you can create a new colorscheme file similar to `colors/wombat.vim`, but reference the new file name instead of `ansi_iterm`.

This will define a new colorscheme using the same mappings as defined in wombat.nvim, but with your new ansi colors.
