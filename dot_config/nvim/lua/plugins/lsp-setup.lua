return {
  {             -- Getting the Lua LSP to work better in the nvim config dir
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  { -- Default configs for a bunch of language servers
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- enable servers here. TODO: get this list from ~/.config/nvim/lsp/ files
      local servers = {
        "efm",
        "lua_ls",
        "openscad_lsp",
        "ruby_lsp",
      }

      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end
  },

  { -- Default configs for efm-ls (A language server adapter for a bunch of linters)
    "creativenull/efmls-configs-nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  }
}
