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

  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  else
    local data = {}
    if color.fg then
      data.fg = color.fg
    end
    if color.bg then
      data.bg = color.bg
    end
    if color.sp then
      data.sp = color.sp
    end
    if color.style and not (color.style == "NONE") then
      if type(color.style) == "string" then
        data[color.style] = true
      end
      if type(color.style) == "table" then
        for _, style in ipairs(color.style) do
          data[style] = true
        end
      end
    end
    vim.api.nvim_set_hl(0, group, data)
    -- vim.cmd(hl)
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
  vim.g.colors_name = "gruvbox-baby"

  -- load base theme
  util.syntax(theme.base)

  vim.defer_fn(function()
    util.syntax(theme.defer)
  end, 100)
end

return util
