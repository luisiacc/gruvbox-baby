local config

-- shim vim for kitty and other generators
vim = vim or { g = {}, o = {} }

local function opt(key, default)
  key = "gruvbox_baby_" .. key
  if vim.g[key] == nil then
    return default
  end
  if vim.g[key] == 0 then
    return false
  end
  return vim.g[key]
end

config = {
  background_color = opt("background_color", "medium"),
  comment_style = opt("comment_style", "italic"),
  keyword_style = opt("keyword_style", "italic"),
  function_style = opt("function_style", "bold"),
  variable_style = opt("variable_style", "NONE"),
  highlights = opt("highlights", {}),
  telescope_theme = opt("telescope_theme", false),
  transparent_mode = opt("transparent_mode", false)
}

return config
