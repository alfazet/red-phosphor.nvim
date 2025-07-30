# Red Phosphor

A red-dominated color scheme to illuminate your editor. Does not require frequent replacement to keep glowing.

**Best paired with a transparent terminal window and a matching wallpaper!**

<p align="center">
  <img src="https://github.com/alfazet/red-phosphor.nvim/blob/main/images/example.png">
</p>

## Installation

Example setup with `lazy.nvim`:
```lua
return {
    "alfazet/red-phosphor.nvim",
    config = function()
        local theme = require("red-phosphor/init")
        theme.setup({
            -- default: true
            transparent = true,
            -- for now only fzf (fzf-lua) available
            integrations = { "fzf" },
            -- optional, if you want to override any of the colors
            palette_overrides = { fg1 = "#00ff00" },
            -- optional, if you want to override any of the highlight groups
            highlight_overrides = { Boolean = { fg = "#0000ff" } },
        })
        theme.colorscheme()
    end,
}
```
