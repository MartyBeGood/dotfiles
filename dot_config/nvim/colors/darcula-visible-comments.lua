vim.opt.background = "dark"
vim.g.colors_name = 'darcula-visible-comments'

-- First we define a group that should be present early on and should be grey
vim.cmd("highlight default link diffComment NONE")

local lush = require("lush")
local darcula_solid = require("lush_theme.darcula-solid")
local spec = lush.extends({ darcula_solid }).with(function()
  local blue_comment = lush.hsl(207, 100, 82)
  local gray_comment = lush.hsl(0, 0, 54) -- the original comment color

  return {
    Comment { fg = blue_comment, gui = "italic" },
    diffComment { fg = gray_comment, gui = "italic" },
  }
end)

lush(spec)

-- Then we link everything else to that one
local gray_comment_groups = {
  "CopilotSuggestion",
  "CopilotAnnotation",
  "cssComment",
  "cssVendor",
  "cssHacks",
  "DiagnosticUnnecessary",
  "dtdComment",
  "dtdParamEntityDPunct",
  "GitComment",
  "gitcommitComment",
  "gitcommitOnBranch",
  "gitcommitArrow",
  "gitcommitDiscardedArrow",
  "gitcommitSelectedArrow",
  "gitcommitUnmergedArrow",
  "hamlComment",
  "hamlHtmlComment",
  "htmlComment",
  "htmlCssStyleComment",
  "javaScriptLineComment",
  "javaScriptComment",
  "LspInfoTip",
  "markdownBlockquote",
  "rubyRegexpComment",
  "rubyComment",
  "rubyDocumentation",
  "rubyData",
  "sassComment",
  "sassCssComment",
  "sassEndOfLineComment",
  "TelescopeResultsComment",
  "TroubleCode",
  "TroubleSource",
  "vbComment",
  "vbLineLabel",
  "vbLineNumber",
  "WhichKeySeparator",
  "WhichKeyValue",
  "xmlAttribPunct",
  "xmlComment",
  "xmlCommentStart",
  "xmlCommentPart",
  "xmlProcessingDelim",
  "@comment",
}
for _, group in ipairs(gray_comment_groups) do
  vim.api.nvim_set_hl(0, group, { link = "diffComment" })
end
