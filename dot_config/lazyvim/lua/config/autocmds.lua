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
    "terminal",
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

-- Turn off autoformatting for certain files
-- Combined logic because path globbing in nvim is finicky. I tried to get the rails-locales-yaml stuff to work with globs but it didn't work until I gave up and used lua pattern matching.
local group = vim.api.nvim_create_augroup("autoformat", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = group,
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    local filetypes_to_disable = {
      "scss",
      "css",
    }
    for _, type_without_formatting in ipairs(filetypes_to_disable) do
      if ft == type_without_formatting then
        vim.b.autoformat = false
        return
      end
    end

    local path = vim.fn.expand("%:p")
    local path_regexes_to_disable = {
      "config/locales/.*%.ya?ml$",
    }
    for _, regex in ipairs(path_regexes_to_disable) do
      if string.match(path, regex) then
        vim.b.autoformat = false
        return
      end
    end
  end,
})

-- Refresh gitsigns when focusing a buffer that has git signs
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  callback = function()
    local ok, gitsigns = pcall(require, "gitsigns")
    if ok and vim.b.gitsigns_status_dict then
      gitsigns.refresh()
    end
  end,
})
