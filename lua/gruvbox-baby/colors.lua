local palette = {
  dark = "#202020",
  foreground = "#ebdbb2",
  background = "#282828",
  background_dark = "#242424",
  bg_light = "#32302f",
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
palette.diff = {
  add = "#26332c",
  change = "#273842",
  delete = "#572E33",
  text = "#314753",
}

local M = {}

function M.config(config)
  config = config or require("gruvbox-baby.config")
  local intensity_map = {
    ["dark"] = {
      dark = "#161616",
      background = "#202020",
      background_dark = "#161616",
    },
    ["medium"] = {
      background = palette.background,
      background_dark = palette.background_dark,
    },
  }

  local colors = palette
  local background = config.background_color or palette.background
  if intensity_map[background] then
    colors = vim.tbl_extend("force", colors, intensity_map[background])
  end

  if config.transparent_mode then
    transparent = {
      background = palette.none,
      background_dark = palette.none,
    }
    colors = vim.tbl_extend("force", colors, { background = palette.none, background_dark = palette.none })
  end
  return colors
end

return M
