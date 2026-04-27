return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {},
        ruby_lsp = {
          mason = false,
        },
        rubocop = {
          mason = false,
        },
        solargraph = {
          enabled = false, -- Not using solargraph in favor of ruby_lsp. Keeping the config here for reference.
          mason = false, -- No autoinstall plz
        },
        -- sourcekit = {},
        jdtls = {},
      },
    },
  },
}
