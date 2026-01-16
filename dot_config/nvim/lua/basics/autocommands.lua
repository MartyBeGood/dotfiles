local group = vim.api.nvim_create_augroup("BasicsAutocommands", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight yanked text",
})

autocmd("TermOpen", {
	group = group,
	pattern = "*",
	callback = function()
		vim.api.nvim_command("setlocal nonumber norelativenumber nocursorline")
	end,
	desc = "Disable line numbers and cursorline in terminal buffers",
})

local start_terminal_in_insert_mode = vim.schedule_wrap(function(data)
	if not (vim.api.nvim_get_current_buf() == data.buf and vim.bo.buftype == "terminal") then
		return
	end
	vim.cmd("startinsert")
end)
autocmd("TermOpen", {
	group = group,
	pattern = "*",
	callback = start_terminal_in_insert_mode,
	desc = "Start terminal buffers in insert mode",
})

autocmd("ModeChanged", {
	group = group,
	pattern = "[V\x16]*:*",
	callback = function()
		vim.wo.relativenumber = string.find(vim.fn.mode(), "^[V\22]") ~= nil
	end,
	desc = "Enable relative line numbers in visual mode",
})
