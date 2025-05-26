-- Automatically close terminal Buffers when their Process is done
vim.api.nvim_create_autocmd("TermClose", {
  callback = function()
    vim.cmd("bdelete")
  end
})


-- Disable Linenumbers in Terminals
vim.api.nvim_create_autocmd("TermEnter", {
  callback = function()
    vim.o.number = false
    vim.o.relativenumber = false
  end
})

-- Automatically Split help Buffers to the right
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L"
})

-- Autoformat, async
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end
})
