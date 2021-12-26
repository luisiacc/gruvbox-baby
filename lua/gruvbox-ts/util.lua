local util = {}

util.colorsUsed = {}
util.colorCache = {}

-- will improve in future
function util.getColor(color)
  return color
end

function util.highlight(group, color)
  if color.fg then
    util.colorsUsed[color.fg] = true
  end
  if color.bg then
    util.colorsUsed[color.bg] = true
  end
  if color.sp then
    util.colorsUsed[color.sp] = true
  end

  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. util.getColor(color.fg) or "guifg=NONE"
  local bg = color.bg and "guibg=" .. util.getColor(color.bg) or "guibg=NONE"
  local sp = color.sp and "guisp=" .. util.getColor(color.sp) or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  else
    -- local data = {}
    -- if color.fg then data.foreground = color.fg end
    -- if color.bg then data.background = color.bg end
    -- if color.sp then data.special = color.sp end
    -- if color.style then data[color.style] = true end
    -- vim.api.nvim_set_hl(ns, group, data)
    vim.cmd(hl)
  end
end

function util.syntax(syntax)
  for group, colors in pairs(syntax) do
    util.highlight(group, colors)
  end
end

function util.load(theme)
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "gruvbox-ts"

  -- load base theme
  util.syntax(theme.base)
end

return util
