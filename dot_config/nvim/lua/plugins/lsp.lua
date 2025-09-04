return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        diagnosticls = {
          init_options = {
            linters = {
              slimlint = {
                command = "slim-lint",
                rootPatterns = { ".git/" },
                debounce = 100,
                args = { "--reporter", "json", "--stdin-file-path", "%filepath" },
                sourceName = "slim-lint",
                parseJson = {
                  errorsRoot = "files[0].offenses",
                  line = "location.line",
                  message = "${message}",
                  security = "severity",
                },
                securities = {
                  error = "error",
                  warning = "warning",
                },
              },
            },
            filetypes = {
              slim = "slimlint",
            },
          },
        },
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
        sourcekit = {},
        jdtls = {
          handlers = {
            -- TODO: Don't suppress everything, just the stuff that's annoying
            ["$/progress"] = function(_, result, ctx) end, -- Disable progress messages (Otherwise you get 3 messages per keystroke).
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- tag = "v1.32.0", -- Pin this to the last release before v2, which broke lazyvim
  },
}
