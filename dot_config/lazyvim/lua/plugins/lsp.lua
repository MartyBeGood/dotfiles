return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {},
        ruby_lsp = {
          mason = false,
          init_options = {
            enabledFeatures = {
              formatting = false,
              diagnostics = false,
            },
          },
        },
        rubocop = {
          mason = false,
        },
        solargraph = {
          enabled = false, -- Not using solargraph in favor of ruby_lsp. Keeping the config here for reference.
          mason = false, -- No autoinstall plz
          settings = {
            solargraph = {
              diagnostics = true,
              autocomplete = false,
            },
          },
          init_options = {
            formatting = true,
          },
        },
        -- sourcekit = {},
        jdtls = {
          handlers = {
            -- TODO: Don't suppress everything, just the stuff that's annoying
            ["$/progress"] = function(_, result, ctx) end, -- Disable progress messages (Otherwise you get 3 messages per keystroke).
          },
        },
      },
    },
  },
}
