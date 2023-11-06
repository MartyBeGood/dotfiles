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
    CommentDim { fg = gray_comment, gui = "italic" },
    diffComment { CommentDim },
    CopilotSuggestion { CommentDim },
    CopilotAnnotation { CommentDim },
    cssHacks { CommentDim },
    DiagnosticUnnecessary { CommentDim },
    dtdComment { CommentDim },
    dtdParamEntityDPunct { CommentDim },
    GitComment { CommentDim },
    gitcommitComment { CommentDim },
    gitcommitOnBranch { CommentDim },
    gitcommitArrow { CommentDim },
    gitcommitDiscardedArrow { CommentDim },
    gitcommitSelectedArrow { CommentDim },
    gitcommitUnmergedArrow { CommentDim },
    hamlComment { CommentDim },
    hamlHtmlComment { CommentDim },
    htmlComment { CommentDim },
    htmlCssStyleComment { CommentDim },
    LspInfoTip { CommentDim },
    markdownBlockquote { CommentDim },
    rubyRegexpComment { CommentDim },
    rubyComment { CommentDim },
    rubyDocumentation { CommentDim },
    rubyData { CommentDim },
    TelescopeResultsComment { CommentDim },
    TroubleCode { CommentDim },
    TroubleSource { CommentDim },
    vbComment { CommentDim },
    vbLineLabel { CommentDim },
    vbLineNumber { CommentDim },
    WhichKeySeparator { CommentDim },
    WhichKeyValue { CommentDim },
    xmlAttribPunct { CommentDim },
    xmlComment { CommentDim },
    xmlCommentStart { CommentDim },
    xmlCommentPart { CommentDim },
    xmlProcessingDelim { CommentDim },
    DiffviewDiffDeleteDim { CommentDim },
    DiffviewStatusIgnored { CommentDim },
    DiffviewFilePanelPath { CommentDim },
    LazyComment { CommentDim },
    GitSignsCurrentLineBlame { CommentDim },

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
