local hsluv = require("gruvbox-baby.hsluv")
local theme_util = require("gruvbox-baby.theme")

local util = {}

util.colorsUsed = {}
util.colorCache = {}

util.bg = "#000000"
util.fg = "#ffffff"
util.day_brightness = 0.3

-- will improve in future
function util.getColor(color)
  return color
end

------------------------------------------------
-- Got this functions from folke/tokyonight.nvim
------------------------------------------------
local function hexToRgb(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function util.blend(fg, bg, alpha)
  bg = hexToRgb(bg)
  fg = hexToRgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg)
  return util.blend(hex, bg or util.bg, math.abs(amount))
end
function util.lighten(hex, amount, fg)
  return util.blend(hex, fg or util.fg, math.abs(amount))
end

function util.brighten(color, percentage)
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

function util.invertColor(color)
  if color ~= "NONE" then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[3] = 100 - hsl[3]
    if hsl[3] < 40 then
      hsl[3] = hsl[3] + (100 - hsl[3]) * util.day_brightness
    end
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

function util.randomColor(color)
  if color ~= "NONE" then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[1] = math.random(1, 360)
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end
------------------------------------------------
-- End of: Got this functions from folke/tokyonight.nvim
------------------------------------------------

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

  theme_util.link_new_highlights()
  -- load base theme
  util.syntax(theme.base)

  vim.defer_fn(function()
    util.syntax(theme.defer)
  end, 100)
end

return util
