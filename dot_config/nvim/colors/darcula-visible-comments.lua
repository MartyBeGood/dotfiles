vim.opt.background = "dark"
vim.g.colors_name = 'darcula-visible-comments'

local lush = require("lush")
local darcula_solid = require("lush_theme.darcula-solid")
local spec = lush.extends({ darcula_solid }).with(function()
  local comment_color = lush.hsl(207, 100, 82)

  return {
    Comment { fg = comment_color, gui = "italic" },
  }
end)

lush(spec)
