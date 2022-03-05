![logo](https://user-images.githubusercontent.com/31720261/156893394-a14a7fee-749c-4d02-8bfd-1a4cb2c479dd.png)

# 🎄 Gruvbox baby!

My variation of the gruvbox theme with full support for treesitter!

## Why?

I wasn't confortable with the gruvbox themes out there, either they didn't have good treesitter support or if they do, I
didn't like their colors on python and javascript/typescript files.

## 📸 Pretty pictures

Lua example
![lua-example](https://user-images.githubusercontent.com/31720261/147399333-5dc8d3dc-b382-4f13-a047-fb99298af028.png)

Python example
![python-example](https://user-images.githubusercontent.com/31720261/147399558-bf00b60a-aea9-46f7-a823-fc760cda05be.png)

React with typescript example
![react-typescript-example](https://user-images.githubusercontent.com/31720261/147399581-66030749-3fa2-466d-aa8a-e79b6181185c.png)

Telescope theme inspired by https://github.com/NvChad/NvChad (You have to enable it via config variable)
![telescope-theme](https://user-images.githubusercontent.com/31720261/151669762-1470aa12-b6ff-47c1-a4e9-ec9b37e0eabe.png)

#### Data from images:

Font: **Jetbrains Mono patched with nerd fonts**

Terminal: https://github.com/wez/wezterm

## ⚙️ Installation

```vim
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
...
colorscheme gruvbox-baby
```

## 🪛 Configuration

> ❗️ configuration needs to be set **BEFORE** loading the color scheme with `colorscheme gruvbox-baby`

| Option           | Default  | Available options                                |
| ---------------- | -------- | -------------------------------------------------|
| background_color | `medium` | `medium`, `dark`                                 |
| transparent_mode | `false`  | `false`, `true` - sets background colors to None |
| comment_style    | `italic` | see `:h attr-list`                               |
| keyword_style    | `italic` | see `:h attr-list`                               |
| function_style   | `bold`   | see `:h attr-list`                               |
| variable_style   | `NONE`   | see `:h attr-list`                               |
| hightlights      | `{}`     | override highlights with your custom colors      |

```lua
-- Example config in Lua
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"

-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
vim.g.gruvbox_baby_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-baby]]
```

```vim
" Example config in VimScript
let g:gruvbox_baby_function_style = "NONE"
let g:gruvbox_baby_keyword_style = "italic"

" Enable telescope theme
let g:gruvbox_baby_telescope_theme = 1

" Enable transparent mode
let g:gruvbox_baby_transparent_mode = 1

" Load the colorscheme
colorscheme gruvbox-baby
```

If you want access to the palette you have to do this:
```lua
local colors = require("gruvbox-baby.colors").config()
vim.g.gruvbox_baby_highlights = {Normal = {fg = colors.orange}}
```

## 🔌 Plugin support

- https://github.com/mhinz/vim-startify
- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/neoclide/coc.nvim
- https://github.com/kyazdani42/nvim-tree.lua
- https://github.com/phaazon/hop.nvim
- https://github.com/lukas-reineke/indent-blankline.nvim
- https://github.com/hrsh7th/nvim-cmp
- https://github.com/nvim-telescope/telescope.nvim
- https://github.com/nvim-lualine/lualine.nvim

### To enable Lualine

To enable `gruvbox-baby` theme for `Lualine`, simply specify it in your lualine settings:

```
require('lualine').setup {
    options = {
        -- ... your lualine config,
        theme = "gruvbox-baby",
        -- ... your lualine config,
    }
}
```
## ☑️ TODO

- [ ] Add specification for background intensity

## Palette

![gruvbox palette](https://user-images.githubusercontent.com/31720261/147415431-13f6c6af-2f76-46c9-8448-20c71e359fc5.png)

```
dark = "#202020",
foreground = "#ebdbb2",
background = "#282828",
background_dark = "#242424",
bg_light = "#32302f",
medium_gray = "#504945",
comment = "#665c54",
gray = "#DEDEDE",
soft_yellow = "#EEBD35",
soft_green = "#98971a",
bright_yellow = "#fabd2f",
orange = "#d65d0e",
red = "#fb4934",
error_red = "#cc241d",
magenta = "#b16286",
pink = "#D4879C",
light_blue = "#7fa2ac",
dark_gray = "#83a598",
blue_gray = "#458588",
forest_green = "#689d6a",
clean_green = "#8ec07c",
milk = "#E7D7AD",

-- Dark theme changes colors to
["dark"] = {
      dark = "#161616",
      background = "#202020",
      background_dark = "#161616",
    },
```
## Aknowledgments

- Shutout to @ThePrimeagen for the inspiration for the plugin name, Gruvbox baby!
- I based my structure on https://github.com/folke/tokyonight.nvim (and also copied some of it)
- The all father 👴 https://github.com/morhetz/gruvbox
