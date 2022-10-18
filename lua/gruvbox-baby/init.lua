local util = require("gruvbox-baby.util")
local theme = require("gruvbox-baby.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
  require("gruvbox-baby.ts-fix")
end

return M
