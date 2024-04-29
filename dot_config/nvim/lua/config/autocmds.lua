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
