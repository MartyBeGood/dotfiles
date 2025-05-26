require("config.core_options")
require("config.lazy")

Snacks.toggle.new({
  id = "format_on_save_global",
  name = "Format on save (global)",
  get = function() return not vim.g.disable_autoformat; end, -- reversing avoids defining the global/buffer-local variable ahead of time
  set = function(state) vim.g.disable_autoformat = not state; end,
}):map("<leader>uF")

Snacks.toggle.new({
  id = "format_on_save_buffer",
  name = "Format on save (buffer)",
  get = function() return not vim.b.disable_autoformat; end,
  set = function(state) vim.b.disable_autoformat = not state; end,
}):map("<leader>uf")
