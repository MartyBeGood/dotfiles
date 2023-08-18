-- see :help lush-pitfalls -> Linters
---@diagnostic disable: undefined-global

vim.opt.background = "dark"
vim.g.colors_name = 'darcula-visible-comments'

local lush = require("lush")
local darcula_solid = require("lush_theme.darcula-solid")
local spec = lush.extends({ darcula_solid }).with(function()
  local blue_comment = lush.hsl(207, 100, 82)
  local gray_comment = darcula_solid.Comment.fg
  local the_spec = {
    Comment { fg = blue_comment, gui = "italic" },

    -- Everything that should have a grey comment color
    UnimportantComment { fg = gray_comment, gui = "italic" },
    diffComment { UnimportantComment },
    CopilotSuggestion { UnimportantComment },
    CopilotAnnotation { UnimportantComment },
    cssComment { UnimportantComment },
    cssVendor { UnimportantComment },
    cssHacks { UnimportantComment },
    DiagnosticUnnecessary { UnimportantComment },
    dtdComment { UnimportantComment },
    dtdParamEntityDPunct { UnimportantComment },
    GitComment { UnimportantComment },
    gitcommitComment { UnimportantComment },
    gitcommitOnBranch { UnimportantComment },
    gitcommitArrow { UnimportantComment },
    gitcommitDiscardedArrow { UnimportantComment },
    gitcommitSelectedArrow { UnimportantComment },
    gitcommitUnmergedArrow { UnimportantComment },
    hamlComment { UnimportantComment },
    hamlHtmlComment { UnimportantComment },
    htmlComment { UnimportantComment },
    htmlCssStyleComment { UnimportantComment },
    javaScriptLineComment { UnimportantComment },
    javaScriptComment { UnimportantComment },
    LspInfoTip { UnimportantComment },
    markdownBlockquote { UnimportantComment },
    rubyRegexpComment { UnimportantComment },
    rubyComment { UnimportantComment },
    rubyDocumentation { UnimportantComment },
    rubyData { UnimportantComment },
    sassComment { UnimportantComment },
    sassCssComment { UnimportantComment },
    sassEndOfLineComment { UnimportantComment },
    TelescopeResultsComment { UnimportantComment },
    TroubleCode { UnimportantComment },
    TroubleSource { UnimportantComment },
    vbComment { UnimportantComment },
    vbLineLabel { UnimportantComment },
    vbLineNumber { UnimportantComment },
    WhichKeySeparator { UnimportantComment },
    WhichKeyValue { UnimportantComment },
    xmlAttribPunct { UnimportantComment },
    xmlComment { UnimportantComment },
    xmlCommentStart { UnimportantComment },
    xmlCommentPart { UnimportantComment },
    xmlProcessingDelim { UnimportantComment },

    -- other fixes
    -- Need to redefine these because reasons
    DiffAdd { fg = darcula_solid.DiffAdd.fg, },
    DiffDelete { fg = darcula_solid.DiffDelete.fg },

    -- Missing from darcula-solid
    GitWordDelete { DiffDelete },
    GitSignsDelete { DiffDelete },
    GitWordAdd { DiffAdd },
    GitSignsAdd { DiffAdd },
  }
  return the_spec
end)

lush(spec)
