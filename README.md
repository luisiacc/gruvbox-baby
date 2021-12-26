![logo](https://user-images.githubusercontent.com/31720261/147401091-2dfe5af9-1984-4470-8394-243953268dc5.png)

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

#### Data from images:

Font: **Jetbrains Mono patched with nerd fonts**

Terminal: https://github.com/wez/wezterm

## ⚙️ Setup

```viml
Plug 'luisiacc/gruvbox-baby'
...
colorscheme gruvbox-baby
```

## 🪛 Configuration

> ❗️ configuration needs to be set **BEFORE** loading the color scheme with `colorscheme gruvbox-baby`


| Option           | Default  | Available options  |
| ---------------- | -------- | ------------------ |
| background_color | `medium` | `medium`, `dark`   |
| comment_style    | `italic` | see `:h attr-list` |
| keyword_style    | `italic` | see `:h attr-list` |
| function_style   | `bold`   | see `:h attr-list` |
| variable_style   | `NONE`   | see `:h attr-list` |

```lua
-- Example config in Lua
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-baby]]
```

```vim
" Example config in VimScript
let g:gruvbox_baby_function_style = "NONE"
let g:gruvbox_baby_keyword_style = "italic"

" Load the colorscheme
colorscheme gruvbox-baby
```

## 🔌 Plugin support

- https://github.com/mhinz/vim-startify
- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/neoclide/coc.nvim
- https://github.com/kyazdani42/nvim-tree.lua
- https://github.com/phaazon/hop.nvim
- https://github.com/lukas-reineke/indent-blankline.nvim
- https://github.com/hrsh7th/nvim-cmp

## ☑️ TODO

- [ ] Add specification for background intensity

## Palette

![gruvbox palette](https://user-images.githubusercontent.com/31720261/147415431-13f6c6af-2f76-46c9-8448-20c71e359fc5.png)

## Aknowledgments

- I based my structure on https://github.com/folke/tokyonight.nvim (and also copied some of it)
- The all father 👴 https://github.com/morhetz/gruvbox
