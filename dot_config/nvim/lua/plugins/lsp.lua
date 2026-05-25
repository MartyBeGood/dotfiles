return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {},
        ruby_lsp = {
          mason = false,
        },
        jdtls = {},
        ty = {},
      },
    },
  },
}
