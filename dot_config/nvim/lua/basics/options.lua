local o, opt = vim.o, vim.opt
if vim.g.mapleader == nil then
	vim.g.mapleader = " "
end

o.undofile = true
o.backup = false
o.writebackup = false
o.mouse = "a"
vim.cmd("filetype plugin indent on")

o.breakindent = true
o.cursorline = true
o.linebreak = true
o.number = true
o.splitbelow = true
o.splitright = true
o.ruler = false

o.showmode = false -- we have a fancy statusline for this
o.signcolumn = "yes" -- keep signcolumn on all the time
o.fillchars = "eob: " -- remove ~ from end of buffer
o.termguicolors = true -- I don't plan to run this config anywhere without true color support

o.ignorecase = true
o.infercase = true
o.smartcase = true
o.incsearch = true

o.smartindent = true
o.completeopt = "menuone,noselect"
o.virtualedit = "block"
o.formatoptions = "qjl1" -- don't continue comments with o/O, don't break lines automatically

opt.shortmess:append("WcC")
opt.splitkeep = "screen"

o.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣"
o.list = true

if vim.fn.exists("syntax_on") ~= 1 then
	vim.cmd([[syntax enable]])
end
