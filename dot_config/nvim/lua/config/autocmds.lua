-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("miniindentscope", { clear = true })
autocmd("FileType", {
  group = "miniindentscope",
  pattern = {
    "NvimTree",
    "fugitive",
    "gitcommit",
    "toggleterm",
  },
  callback = function()
    vim.api.nvim_buf_set_var(vim.api.nvim_get_current_buf(), "miniindentscope_disable", true)
  end,
})

autocmd("FileType", {
  group = "miniindentscope",
  pattern = { "slim", "python", "yaml" },
  callback = function()
    vim.api.nvim_buf_set_var(vim.api.nvim_get_current_buf(), "miniindentscope_config", { options = { border = "top" } })
  end,
})

-- Don't auto comment new lines if the line I'm coming from is commented
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Turn line numbers off in terminal buffers
augroup("termopen", { clear = true })
autocmd("TermOpen", {
  group = "termopen",
  pattern = "*",
  callback = function()
    vim.api.nvim_command("setlocal nonumber norelativenumber nocursorline")
  end,
})

-- ...and in fugitive
augroup("fugitiveLineNumbers", { clear = true })
autocmd("FileType", {
  group = "fugitiveLineNumbers",
  pattern = "fugitive",
  callback = function()
    vim.api.nvim_command("setlocal nonumber norelativenumber")
  end,
})

-- Treat eruby.yaml as yaml
augroup("syntaxfixes", { clear = true })
autocmd("FileType", {
  group = "syntaxfixes",
  pattern = "eruby.yaml",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

-- Turn off autoformatting for certain filetypes
augroup("autoformat", { clear = true })
autocmd("FileType", {
  group = "autoformat",
  pattern = { "scss", "css" },
  callback = function()
    vim.b.autoformat = false
  end,
})
