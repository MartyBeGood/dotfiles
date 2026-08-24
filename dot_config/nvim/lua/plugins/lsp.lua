return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cooklang_lsp = { mason = false },
        emmet_ls = {},
        pyright = { mason = false },
        ruby_lsp = { mason = false },
        rubocop = { mason = false },
        -- sourcekit = {},
        jdtls = {},
        ty = {},
      },
    },
  },
}
