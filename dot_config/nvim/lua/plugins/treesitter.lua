return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",

    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },

    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        auto_install = true,
        ensure_installed = { "c", "lua", "vimdoc", "query" },
        ignore_install = {},
        modules = {},
        sync_install = false, -- Don't install parsers synchronously (only applied to `ensure_installed`)
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'markdown', 'gitcommit' }, -- TS seems to take away highlighting from these filetypes
        },
        indent = {
          enable = true,
          -- Disabling treesitter-indentation until either of the following tickets is resolved:
          -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3363
          -- https://github.com/tree-sitter/tree-sitter-ruby/issues/230
          disable = { 'ruby' }
        },
        autotag = {
          enable = true,
        },
        endwise = {
          enable = true,
        }
      })
    end,

  }
}
