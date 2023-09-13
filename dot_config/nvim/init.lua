local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

if vim.g.vscode then
else
  require("options")
  require("autocmds")

  vim.cmd.colorscheme('darcula-visible-comments')

  if vim.g.neovide or vim.g.fvim_loaded then
    vim.o.guifont = "Nerdosevka:h15:w-1"
    vim.opt.linespace = 1
  end

  require("helpers").link_navic_to_other_hlgroups()
end
