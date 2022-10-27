local wk = require('which-key')
local cmdify = require('helpers').cmdify

wk.setup({
  plugins = {
    registers = false,
  },
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
    ["<space>"] = { cmdify("Telescope find_files"), "Find Files" },
    b = {
      name = "Buffer...",
      b = { cmdify("Telescope buffers"), "Switch buffers" },
    },
    l = {
      name = "List..",
      d = { cmdify("Trouble document_diagnostics"), "Diagnostics in file" },
      D = { cmdify("Trouble workspace_diagnostics"), "Diagnostics in workspace" },
      r = { cmdify("Trouble lsp_references"), "References" },
    },
    g = {
      name = "Git...",
      g = { function() require('neogit').open() end, "Overview" },
      B = { cmdify("Git blame"), "Blame" },
      s = { cmdify("Git sync"), "pull, then push" }
    },
    o = {
      name = "Open...",
      f = { cmdify("NvimTreeToggle"), "File Browser" },
      F = { cmdify("NvimTreeFindFileToggle"), "File Browser at current file" },

    },
    s = {
      name = "Search...",
      s = { cmdify("Telescope grep_string"), "String under cursor" },
      g = { cmdify("Telescope live_grep"), "String in project" },
      h = { cmdify("Telescope help_tags"), "Vim Helptags" },
    },
    t = {
      name = "Tests...",
      t = { cmdify("TestNearest"), "Run nearest" },
      f = { cmdify("TestFile"), "Run all in file" },
      l = { cmdify("TestLast"), "Run last" },
      s = { cmdify("TestSuite"), "Run full suite" },
    },
  },
  g = {
    p = {
      name = "gf in previous window",
      f = { cmdify("call gfriend#goto_cfile(winwidth(0) >=# 180 ? 'vsp' : 'sp')"), "File under cursor" },
      F = { cmdify("call gfriend#goto_cWORD(winwidth(0) >=# 180 ? 'vsp' : 'sp')"), "File&line under cursor" }
    }
  }
})

wk.register({ ["<esc>"] = { termcodes([[<C-\><C-n>]]), "Exit insert mode" } }, { mode = 't' })
