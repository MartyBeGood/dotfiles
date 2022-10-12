local wk = require('which-key')
local h = require('helpers/misc')

wk.setup({
  registers = false,
  key_labels = {
    ["<space>"] = "SPC",
    ["<tab>"] = "TAB",
  }
})

local termcodes = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

wk.register({
  ["<space>"] = {
    ["<space>"] = { h.cmdify("Telescope find_files"), "Find Files" },
    b = {
      name = "Buffer...",
      b = { h.cmdify("Telescope buffers"), "Switch buffers" },
    },
    g = {
      name = "Goto...",
      g = { h.cmdify("Git"), "Git overview" },
      B = { h.cmdify("Git blame"), "Git blame" },
    },
    o = {
      name = "Open...",
      f = { h.cmdify("NvimTreeToggle"), "File Browser" },
      F = { h.cmdify("NvimTreeFindFileToggle"), "File Browser at current file"}

    },
    s = {
      name = "Search...",
      s = { h.cmdify("Telescope grep_string"), "String under cursor" },
      g = { h.cmdify("Telescope live_grep"), "String in project" },
      h = { h.cmdify("Telescope help_tags"), "Vim Helptags" },
    },
    t = {
      name = "Tests...",
      t = { h.cmdify("TestNearest"), "Run nearest" },
      f = { h.cmdify("TestFile"), "Run nearest" },
      l = { h.cmdify("TestLast"), "Run last" },
      s = { h.cmdify("TestSuite"), "Run full suite" },
    },
  },
  g = {
    p = {
      name = "gf in previous window",
      f = { h.cmdify("call gfriend#goto_cfile(winwidth(0) >=# 180 ? 'vsp' : 'sp')"), "File under cursor" },
      F = { h.cmdify("call gfriend#goto_cWORD(winwidth(0) >=# 180 ? 'vsp' : 'sp')"), "File&line under cursor" }
    }
  }
})

wk.register({ ["<esc>"] = { termcodes([[<C-\><C-n>]]), "Exit insert mode" } }, { mode = 't' })
