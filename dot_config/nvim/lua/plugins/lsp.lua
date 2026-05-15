return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
