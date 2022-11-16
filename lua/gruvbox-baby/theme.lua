local M = {}

-- local _debug = function(content)
--   local f = io.open("/home/acc/.nvim.debug.log", "a")
--
--   f:write(vim.inspect(content) .. "\n")
--   f.close()
-- end
function M.link_new_highlights()
  if vim.fn.has("nvim-0.8.0") == 0 then
    return
  end
  vim.cmd([[
    highlight! link @annotation TSAnnotation
    highlight! link @attribute TSAttribute
    highlight! link @boolean TSBoolean
    highlight! link @character TSCharacter
    highlight! link @comment TSComment
    highlight! link @conditional TSConditional
    highlight! link @constant TSConstant
    highlight! link @constant.builtin TSConstBuiltin
    highlight! link @constant.macro TSConstMacro
    highlight! link @constructor TSConstructor
    highlight! link @exception TSException
    highlight! link @field TSField
    highlight! link @float TSFloat
    highlight! link @function TSFunction
    highlight! link @function.builtin TSFuncBuiltin
    highlight! link @function.macro TSFuncMacro
    highlight! link @include TSInclude
    highlight! link @keyword TSKeyword
    highlight! link @keyword.function TSKeywordFunction
    highlight! link @keyword.operator TSKeywordOperator
    highlight! link @label TSLabel
    highlight! link @method TSMethod
    highlight! link @namespace TSNamespace
    highlight! link @none TSNone
    highlight! link @number TSNumber
    highlight! link @operator TSOperator
    highlight! link @parameter TSParameter
    highlight! link @parameter.reference TSParameterReference
    highlight! link @property TSProperty
    highlight! link @punctuation.bracket TSPunctBracket
    highlight! link @punctuation.delimiter TSPunctDelimiter
    highlight! link @punctuation.special TSPunctSpecial
    highlight! link @repeat TSRepeat
    highlight! link @storageclass TSStorageClass
    highlight! link @storageclass.lifetime TSStorageClassLifetime
    highlight! link @string TSString
    highlight! link @string.escape TSStringEscape
    highlight! link @string.regex TSStringRegex
    highlight! link @structure TSStructure
    highlight! link @symbol TSSymbol
    highlight! link @tag TSTag
    highlight! link @tag.attribute TSAttribute
    highlight! link @tag.delimiter TSTagDelimiter
    highlight! link @text TSText
    highlight! link @strike TSStrike
    highlight! link @math TSMath
    highlight! link @type TSType
    highlight! link @type.builtin TSTypeBuiltin
    highlight! link @type.qualifier TSTypeQualifier
    highlight! link @uri TSURI
    highlight! link @variable TSVariable
    highlight! link @variable.builtin TSVariableBuiltin

    highlight! link @variable.python pythonTSVariable
    highlight! link @decorator.python pythonTSDecorator
    highlight! link @variable.rust rustTSVariable
    highlight! link @conditional.javascript javascriptTSConditional
    highlight! link @variable.javascript javascriptTSVariable
  ]])
end

function M.setup(config)
  config = config or require("gruvbox-baby.config")
  local colors = require("gruvbox-baby.colors")
  local c = colors.config(config)

  local theme = {}
  theme.defer = {}
  theme.base = {
    NormalFloat = { fg = c.foreground, bg = c.background_dark },
    Normal = { fg = c.foreground, bg = c.background },
    Comment = { fg = c.comment, style = config.comment_style },
    Constant = { fg = c.soft_yellow },
    String = { fg = c.soft_green, style = config.string_style },
    Character = { fg = c.soft_yellow },
    Number = { fg = c.bright_yellow },
    Boolean = { fg = c.orange },
    Float = { fg = c.bright_yellow },
    Identifier = { fg = c.soft_yellow, style = config.variable_style },
    Function = { fg = c.soft_yellow },
    Statement = { fg = c.red },
    Conditional = { fg = c.foreground },
    Repeat = { fg = c.magenta },
    Label = { fg = c.dark_gray },
    Operator = { fg = c.foreground },
    Keyword = { fg = c.red, style = config.keyword_style },
    Exception = { fg = c.magenta },
    PreProc = { fg = c.soft_yellow },
    Include = { fg = c.red },
    Define = { fg = c.magenta },
    Title = { fg = c.foreground },
    Macro = { fg = c.magenta },
    PreCondit = { fg = c.magenta },
    Type = { fg = c.soft_yellow },
    StorageClass = { fg = c.blue_gray },
    Structure = { fg = c.soft_yellow },
    Typedef = { fg = c.soft_yellow },
    Special = { fg = c.dark_gray},
    SpecialComment = { fg = c.comment },
    MoreMsg = { fg = c.foreground },
    Error = { fg = c.red, style = "bold" },
    Todo = { fg = c.magenta, style = "bold" },
    CursorLineNr = { fg = c.comment, style = "bold" },
    debugPc = { bg = c.error_red },
    Conceal = { fg = c.comment },
    Directory = { fg = c.dark_gray },

    TabLine = { bg = c.dark, fg = c.comment }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.background }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.foreground, bg = c.background_dark }, -- tab pages line, active tab page label

    DiffAdd = { bg = c.diff.add },
    DiffChange = { bg = c.diff.change },
    DiffDelete = { bg = c.diff.delete },
    DiffText = { bg = c.diff.text },

    ErrorMsg = { fg = c.red },
    VertSplit = { fg = c.background_light },
    Folded = { fg = c.comment },
    IncSearch = { fg = c.forest_green, bg = c.comment },
    LineNr = { fg = c.medium_gray },
    MatchParen = { bg = c.blue_gray, style = "underline" },
    NonText = { fg = c.comment },
    Pmenu = { fg = c.foreground, bg = c.background_light },
    PmenuSel = { fg = c.background, bg = c.blue_gray },
    Question = { fg = c.magenta },
    QuickFixLine = { fg = c.background, bg = c.soft_yellow },
    Search = { fg = c.background, bg = c.foreground },
    SpecialKey = { fg = c.comment },
    SpellBad = { fg = c.red, style = "underline" },
    SpellCap = { fg = c.bright_yellow },
    SpellLocal = { fg = c.bright_yellow },
    SpellRare = { fg = c.bright_yellow },
    StatusLine = { fg = c.foreground, bg = c.medium_gray },
    StatusLineNC = { fg = c.comment },
    StatusLineTerm = { fg = c.foreground, bg = c.medium_gray },
    StatusLineTermNC = { fg = c.medium_gray },
    Terminal = { fg = c.foreground, bg = c.background },
    VisualNOS = { fg = c.medium_gray },
    WarningMsg = { fg = c.soft_yellow },
    WildMenu = { fg = c.background, bg = c.blue_gray },
    EndOfBuffer = { fg = c.background },

    -- Tree Sitter
    TSBoolean = { fg = c.orange },
    TSDefine = { fg = c.red },
    TSComment = { fg = c.comment, style = config.comment_style },
    TSError = { fg = c.red },
    TSPunctDelimiter = { fg = c.foreground },
    TSPunctBracket = { fg = c.foreground },
    TSPunctSpecial = { fg = c.foreground },
    TSConstant = { fg = c.pink, style = "bold" },
    TSConstBuiltin = { fg = c.pink },
    TSString = { fg = c.soft_green, style = config.string_style },
    TSCharacter = { fg = c.soft_green },
    TSNumber = { fg = c.magenta },
    TSNamespace = { fg = c.light_blue },
    TSFuncBuiltin = { fg = c.soft_yellow },
    TSFunction = { fg = c.soft_yellow, style = config.function_style },
    TSFuncMacro = { fg = c.soft_yellow },
    TSParameter = { fg = c.blue_gray, style = "nocombine" },
    TSParameterReference = { fg = c.dark_gray },
    TSMethod = { fg = c.soft_yellow, style = config.function_style },
    TSField = { fg = c.light_blue },
    TSProperty = { fg = c.blue_gray },
    TSConstructor = { fg = c.clean_green, style = "nocombine" },
    TSConditional = { fg = c.red },
    TSRepeat = { fg = c.red },
    TSLabel = { fg = c.blue_gray },
    TSKeyword = { fg = c.red, style = config.keyword_style },
    -- TSKeywordReturn = { fg = c.red, style = config.keyword_style },
    TSKeywordFunction = { fg = c.red, style = config.keyword_style },
    TSKeywordOperator = { fg = c.red },
    TSOperator = { fg = c.foreground },
    TSException = { fg = c.red },
    TSType = { fg = c.clean_green },
    TSTypeBuiltin = { fg = c.blue_gray },
    TSTypeQualifier = { fg = c.orange },
    TSStorageClassLifetime = {fg = c.orange},
    TSStructure = { fg = c.blue_gray },
    TSVariable = { fg = c.light_blue, style = config.variable_style },
    TSVariableBuiltin = { fg = c.blue_gray },
    TSText = { fg = c.soft_yellow },
    TSStrong = { fg = c.soft_yellow },
    TSEmphasis = { fg = c.soft_yellow },
    TSUnderline = { fg = c.soft_yellow },
    TSTitle = { fg = c.soft_yellow },
    TSLiteral = { fg = c.soft_yellow },
    TSURI = { fg = c.soft_yellow },
    TSTag = { fg = c.clean_green },
    TSTagDelimiter = { fg = c.comment },

    -- per language TreeSitter
    pythonTSVariable = { fg = c.foreground, bg = c.NONE, style = "NONE" },
    pythonDecorator = { fg = c.orange, style = "bold" },
    rustTSVariable = { fg = c.foreground, bg = c.NONE, style = "NONE" },
    javascriptTSConditional = { fg = c.red },
    javascriptTSVariable = { fg = c.light_blue },
    TSTagAttribute = { fg = c.soft_yellow },

    htmlArg = { fg = c.soft_yellow },
    htmlBold = { fg = c.bright_yellow, style = "bold" },
    htmlEndTag = { fg = c.foreground },
    htmlH1 = { fg = c.foreground },
    htmlH2 = { fg = c.foreground },
    htmlH3 = { fg = c.foreground },
    htmlH4 = { fg = c.foreground },
    htmlH5 = { fg = c.foreground },
    htmlH6 = { fg = c.foreground },
    htmlItalic = { fg = c.magenta, style = "italic" },
    htmlLink = { fg = c.foreground, style = "underline" },
    htmlSpecialChar = { fg = c.soft_yellow },
    htmlSpecialTagName = { fg = c.blue_gray },
    htmlTag = { fg = c.dark_gray },
    htmlTagN = { fg = c.orange },
    htmlTagName = { fg = c.orange },
    htmlTitle = { fg = c.foreground },

    markdownBlockquote = { fg = c.comment },
    markdownBold = { fg = c.bright_yellow, style = "bold" },
    markdownCode = { fg = c.soft_yellow },
    markdownCodeBlock = { fg = c.comment },
    markdownCodeDelimiter = { fg = c.comment },
    markdownH1 = { fg = c.foreground },
    markdownH2 = { fg = c.foreground },
    markdownH3 = { fg = c.foreground },
    markdownH4 = { fg = c.foreground },
    markdownH5 = { fg = c.foreground },
    markdownH6 = { fg = c.foreground },
    markdownHeadingDelimiter = { fg = c.orange },
    markdownHeadingRule = { fg = c.comment },
    markdownId = { fg = c.magenta },
    markdownIdDeclaration = { fg = c.blue_gray },
    markdownIdDelimiter = { fg = c.magenta },
    markdownItalic = { fg = c.magenta, style = "italic" },
    markdownLinkDelimiter = { fg = c.magenta },
    markdownLinkText = { fg = c.blue_gray },
    markdownListMarker = { fg = c.orange },
    markdownOrderedListMarker = { fg = c.orange },
    markdownRule = { fg = c.comment },
    markdownUrl = { fg = c.soft_green, style = "underline" },

    phpInclude = { fg = c.magenta },
    phpClass = { fg = c.soft_yellow },
    phpClasses = { fg = c.soft_yellow },
    phpFunction = { fg = c.blue_gray },
    phpType = { fg = c.magenta },
    phpKeyword = { fg = c.magenta },
    phpVarSelector = { fg = c.foreground },
    phpIdentifier = { fg = c.foreground },
    phpMethod = { fg = c.blue_gray },
    phpBoolean = { fg = c.blue_gray },
    phpParent = { fg = c.foreground },
    phpOperator = { fg = c.magenta },
    phpRegion = { fg = c.magenta },
    phpUseNamespaceSeparator = { fg = c.foreground },
    phpClassNamespaceSeparator = { fg = c.foreground },
    phpDocTags = { fg = c.magenta },
    phpDocParam = { fg = c.magenta },

    CocExplorerIndentLine = { fg = c.comment },
    CocExplorerBufferRoot = { fg = c.orange },
    CocExplorerFileRoot = { fg = c.orange },
    CocExplorerBufferFullPath = { fg = c.comment },
    CocExplorerFileFullPath = { fg = c.comment },
    CocExplorerBufferReadonly = { fg = c.magenta },
    CocExplorerBufferModified = { fg = c.magenta },
    CocExplorerBufferNameVisible = { fg = c.orange },
    CocExplorerFileReadonly = { fg = c.magenta },
    CocExplorerFileModified = { fg = c.magenta },
    CocExplorerFileHidden = { fg = c.comment },
    CocExplorerHelpLine = { fg = c.magenta },
    CocHighlightText = { bg = c.dark },

    EasyMotionTarget = { fg = c.red, style = "bold" },
    EasyMotionTarget2First = { fg = c.red, style = "bold" },
    EasyMotionTarget2Second = { fg = c.red, style = "bold" },

    StartifyNumber = { fg = c.foreground },
    StartifySelect = { fg = c.blue_gray },
    StartifyBracket = { fg = c.blue_gray },
    StartifySpecial = { fg = c.orange },
    StartifyVar = { fg = c.blue_gray },
    StartifyPath = { fg = c.soft_yellow },
    StartifyFile = { fg = c.foreground },
    StartifySlash = { fg = c.foreground },
    StartifyHeader = { fg = c.medium_gray },
    StartifySection = { fg = c.soft_yellow },
    StartifyFooter = { fg = c.soft_yellow },

    WhichKey = { fg = c.magenta },
    WhichKeySeperator = { fg = c.soft_yellow },
    WhichKeyGroup = { fg = c.orange },
    WhichKeyDesc = { fg = c.forest_green },

    diffAdded = { fg = c.forest_green },
    diffRemoved = { fg = c.red },
    diffFileId = { fg = c.magenta },
    diffFile = { fg = c.comment },
    diffNewFile = { fg = c.soft_yellow },
    diffOldFile = { fg = c.orange },

    SignifySignAdd = { fg = c.soft_yellow },
    SignifySignChange = { fg = c.soft_yellow },
    SignifySignDelete = { fg = c.orange },
    GitGutterAdd = { fg = c.forest_green },
    GitGutterChange = { fg = c.soft_yellow },
    GitGutterDelete = { fg = c.error_red },
    debugBreakpoint = { fg = c.error_red, style = "reverse" },

    VimwikiHeader1 = { fg = c.orange, style = "bold" },
    VimwikiHeader2 = { fg = c.soft_green, style = "bold" },
    VimwikiHeader3 = { fg = c.dark_gray, style = "bold" },
    VimwikiHeader4 = { fg = c.clean_green, style = "bold" },
    VimwikiHeader5 = { fg = c.red, style = "bold" },
    VimwikiHeader6 = { fg = c.pink, style = "bold" },
    VimwikiLink = { fg = c.forest_green },
    VimwikiHeaderChar = { fg = c.medium_gray },
    VimwikiHR = { fg = c.soft_yellow },
    VimwikiList = { fg = c.orange },
    VimwikiTag = { fg = c.orange },
    VimwikiMarkers = { fg = c.medium_gray },

    ColorColumn = { bg = c.background_dark },
    SignColumn = { bg = c.background },
    CursorColumn = { bg = c.background_light },
    CursorLine = { bg = c.background_light },
    FoldColumn = { fg = c.NONE },
    PmenuSbar = { bg = c.comment },
    PmenuThumb = { bg = c.foreground },
    EasyMotionShade = { fg = c.NONE },
    Visual = { bg = c.medium_gray },
    MultiCursor = { bg = c.background_light },
    Cursor = { bg = c.medium_gray, fg = c.NONE },

    -- mix
    GitSignsCurrentLineBlame = { fg = c.medium_gray },
    Underlined = { fg = c.error_red, style = "underline" },
    cppTSVariable = { fg = c.milk },

    -- Nvim Tree
    NvimTreeNormal = { fg = c.foreground, bg = c.background_dark },
    NvimTreeNormalNC = { fg = c.foreground, bg = c.background_dark },
    NvimTreeFolderIcon = { fg = c.soft_yellow },
    NvimTreeRootFolder = { fg = c.magenta },
    NvimTreeExecFile = { fg = c.light_blue, style = "NONE" },

    NvimTreeGitDirty = { fg = c.red },
    NvimTreeGitStaged = { fg = c.foreground },
    NvimTreeGitMerge = { fg = c.soft_yellow },
    NvimTreeGitRenamed = { fg = c.soft_yellow },
    NvimTreeGitNew = { fg = c.soft_green },
    NvimTreeGitDeleted = { fg = c.red },

    -- Hop
    HopNextKey = { fg = c.soft_yellow, bg = c.dark, style = "bold" },
    HopNextKey1 = { fg = c.soft_yellow, bg = c.dark, style = "bold" },
    HopNextKey2 = { fg = c.milk, bg = c.dark },

    -- indent blankline
    IndentBlanklineChar = { fg = "#313131" },
    IndentBlanklineSpaceChar = { fg = "#313131" },
    IndentBlanklineContextChar = { fg = "#365050" },

    FloatBorder = { bg = c.background_dark },
    -- Cmp
    CmpDocumentation = { fg = c.foreground, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.medium_gray, bg = c.bg_float },

    CmpItemAbbr = { fg = c.foreground },
    CmpItemAbbrDeprecated = { fg = c.milk, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.light_blue },
    CmpItemAbbrMatchFuzzy = { fg = c.light_blue },

    CmpItemKindDefault = { fg = c.dark_gray },
    CmpItemMenu = { fg = c.comment },

    CmpItemKindKeyword = { fg = c.blue_gray },

    CmpItemKindVariable = { fg = c.magenta },
    CmpItemKindConstant = { fg = c.magenta },
    CmpItemKindReference = { fg = c.magenta },
    CmpItemKindValue = { fg = c.magenta },

    CmpItemKindFunction = { fg = c.orange },
    CmpItemKindMethod = { fg = c.orange },
    CmpItemKindConstructor = { fg = c.orange },

    CmpItemKindClass = { fg = c.pink },
    CmpItemKindInterface = { fg = c.pink },
    CmpItemKindStruct = { fg = c.pink },
    CmpItemKindEvent = { fg = c.pink },
    CmpItemKindEnum = { fg = c.pink },
    CmpItemKindUnit = { fg = c.pink },

    CmpItemKindModule = { fg = c.soft_yellow },

    CmpItemKindProperty = { fg = c.forest_green },
    CmpItemKindField = { fg = c.forest_green },
    CmpItemKindTypeParameter = { fg = c.forest_green },
    CmpItemKindEnumMember = { fg = c.forest_green },
    CmpItemKindOperator = { fg = c.forest_green },
    CmpItemKindSnippet = { fg = c.gray },

    -- Mutt-Mail:
    mailHeader = { fg = c.red },
    mailHeaderKey = { fg = c.red },
    mailHeaderEmail = { fg = c.magenta },
    mailSubject = { fg = c.forest_green, style = "italic" },

    mailQuoted1 = { fg = c.clean_green },
    mailQuoted2 = { fg = c.light_blue },
    mailQuoted3 = { fg = c.blue_gray },
    mailQuoted4 = { fg = c.pink },
    mailQuoted5 = { fg = c.soft_green },
    mailQuoted6 = { fg = c.orange },

    mailQuotedExp1 = { fg = c.milk },
    mailQuotedExp2 = { fg = c.light_blue },
    mailQuotedExp3 = { fg = c.blue_gray },
    mailQuotedExp4 = { fg = c.pink },
    mailQuotedExp5 = { fg = c.soft_green },
    mailQuotedExp6 = { fg = c.orange },

    mailSignature = { fg = c.comment },
    mailURL = { fg = c.orange, style = "underline" },
    mailEmail = { fg = c.soft_yellow },

    rainbowcol1 = { fg = c.magenta },
    rainbowcol2 = { fg = c.dark_gray},
    rainbowcol3 = { fg = c.clean_green},
    rainbowcol4 = { fg = c.soft_green},
    rainbowcol5 = { fg = c.soft_yellow},
    rainbowcol6 = { fg = c.orange},
    rainbowcol7 = { fg = c.pink},

    -- Illuminate:
    IlluminatedWordText = { bg = c.background_light },
    IlluminatedWordRead = { bg = c.background_light },
    IlluminatedWordWrite = { bg = c.background_light },
  }

  if config.telescope_theme then
    theme.base = vim.tbl_extend("force", theme.base, {
      -- Telescope
      TelescopeBorder = { fg = c.background_dark, bg = c.background_dark },
      TelescopePromptCounter = { fg = c.milk, bg = c.medium_gray },
      TelescopePromptBorder = { fg = c.medium_gray, bg = c.medium_gray },
      TelescopePromptNormal = { fg = c.milk, bg = c.medium_gray },
      TelescopePromptPrefix = { fg = c.soft_yellow, bg = c.medium_gray },

      TelescopeNormal = { bg = c.background_dark },

      TelescopePreviewTitle = { fg = c.background, bg = c.forest_green },
      TelescopePromptTitle = { fg = c.background, bg = c.soft_yellow },
      TelescopeResultsTitle = { fg = c.background_dark, bg = c.milk },

      TelescopeSelection = { bg = c.diff.change },
    })
  end

  if config.transparent_mode then
    theme.base = vim.tbl_extend("force", theme.base, {
      Visual = { bg = c.medium_gray },
      MultiCursor = { bg = c.medium_gray },
      Cursor = { bg = c.soft_green, c.dark },
    })
  end

  theme.base = vim.tbl_extend("force", theme.base, config.highlights or {})
  return theme
end

return M
