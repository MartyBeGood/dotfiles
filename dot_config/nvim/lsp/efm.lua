local slim_lint = require("efmls-configs.linters.slim_lint")
local languages = {
  slim = { slim_lint }
}

return {
  filetypes = vim.tbl_keys(languages),
  settings = {
    languages = languages
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true
  }
}
