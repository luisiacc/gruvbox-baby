local util = require("gruvbox-ts.util")
local theme = require("gruvbox-ts.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
