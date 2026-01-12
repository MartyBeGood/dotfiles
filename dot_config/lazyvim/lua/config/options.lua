-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.laststatus = 2
vim.g.lualine_laststatus = 2
vim.opt.wrap = true
vim.opt.relativenumber = false
vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"
vim.opt.splitkeep = "cursor"
vim.opt.clipboard = "" -- Don't use system clipboard anywhere. The LazyVim default of "use system clipboard unless in SSH" confuses me.

vim.opt.breakindent = true
vim.g.snacks_animate = false

vim.g.maplocalleader = ","

if vim.env.SSH_TTY and not vim.env.TMUX then
  vim.g.clipboard = {
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
