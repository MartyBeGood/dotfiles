vim.opt.background = "dark"
vim.g.colors_name = 'darcula-visible-comments'

-- First we define a group that should be present early on and should be grey
vim.cmd("highlight default link diffComment NONE")

local lush = require("lush")
local darcula_solid = require("lush_theme.darcula-solid")
local spec = lush.extends({ darcula_solid }).with(function()
  local blue_comment = lush.hsl(207, 100, 82)
  local gray_comment = lush.hsl(0, 0, 54) -- the original comment color
  local the_spec = {
    Comment { fg = blue_comment, gui = "italic" },
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
  }

  return the_spec
end)

lush(spec)
