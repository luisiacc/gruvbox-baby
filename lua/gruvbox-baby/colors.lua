local util = require("gruvbox-baby.util")

local the_palette = {
  dark0 = "#0d0e0f",
  dark = "#202020",
  foreground = "#ebdbb2",
  background = "#282828",
  background_dark = "#1d2021",
  background_light = "#32302f",
  medium_gray = "#504945",
  comment = "#665c54",
  gray = "#DEDEDE",
  soft_yellow = "#eebd35",
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
  none = "NONE",
}

-- these are backgrounds
the_palette.diff = {
  add = "#26332c",
  change = "#273842",
  delete = "#572E33",
  text = "#314753",
}

local original_palette = vim.tbl_extend("force", the_palette, {
  foreground = "#fbf1c7",
  soft_green = "#b8bb26",
  forest_green = "#b8bb26",
  soft_yellow = "#fabd2f",
  light_blue = "#83a598",
  magenta = "#d3869b",
  orange = "#fe8019",
  gray = "#928374",
  comment = "#928374",
})

local M = {}

function M.config(config)
  config = config or require("gruvbox-baby.config")
  local colors
  if config.use_original_palette then
    colors = original_palette
  else
    colors = the_palette
  end

  local intensity_map = {
    ["dark"] = {
      dark = colors.dark0,
      background = colors.background_dark,
      background_dark = util.darken(colors.background_dark, 0.8),
    },
    ["medium"] = {
      background = colors.background,
      background_dark = util.darken(colors.background, 0.9),
    },
    ["soft"] = {
      background = colors.background_light,
      background_dark = util.darken(colors.background_light, 0.8),
      background_light = util.lighten(colors.background_light, 0.95),
    },
    ["soft_flat"] = {
      background = colors.background_light,
      background_dark = colors.background_light,
      background_light = util.lighten(colors.background_light, 0.95),
    },
  }

  local background = config.background_color or colors.background
  if intensity_map[background] then
    colors = vim.tbl_extend("force", colors, intensity_map[background])
  end

  if config.transparent_mode then
    local transparent = {
      background = colors.none,
    }
    colors = vim.tbl_extend("force", colors, transparent)
  end
  return colors
end

return M
