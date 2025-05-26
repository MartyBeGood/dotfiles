local g = vim.g
local opt = vim.opt
local env = vim.env

g.mapleader = " "
g.maplocalleader = "\\"
opt.laststatus = 2
g.lualine_laststatus = 2
opt.wrap = true
opt.relativenumber = false
opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"
opt.splitkeep = "cursor"

opt.breakindent = true
opt.undofile = true

opt.number = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300

opt.splitbelow = true
opt.splitright = true


opt.list = true -- show whitespace
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.inccommand = "split" -- live preview for substitutions

-- sane searching (incremental highlighting, case-insensitive search unless \C or a capital letter is included in the search term)
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.scrolloff = 10

-- Raise a dialog asking to save a file if e.g. :q would fail due to an unsaved file
opt.confirm = true

-- Indentation settings
local tab_width = 2
opt.tabstop = tab_width
opt.softtabstop = tab_width
opt.shiftwidth = tab_width
opt.expandtab = true
opt.smartindent = true

opt.termguicolors = true

-- opt.guicursor = "guicursor=n-v-c-sm:block,i-ci-ve:ver50,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"

-- Copying stuff
if env.SSH_TTY and not env.TMUX then
  g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
-- End Copying stuff

vim.diagnostic.config({ virtual_lines = true })

-- vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
