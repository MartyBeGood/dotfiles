return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
      },
      completion = {
        list = {
          selection = {
            preselect = false,
          },
        },
        ghost_text = {
          enabled = false,
          show_with_selection = false,
        },
      },
    },
  },
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
        },
        solargraph = {
          enabled = false, -- Not using solargraph in favor of ruby_lsp. Keeping the config here for reference.
          mason = false, -- No autoinstall plz
          settings = {
            solargraph = {
              diagnostics = true,
            },
          },
          init_options = {
            formatting = true,
          },
        },
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
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-y>",
          accept_line = "<M-l>",
          next = "<M-n>",
          prev = "<M-p>",
        },
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    -- Remove all keybindings. They're handled in nvim-cmp.
    keys = function()
      return {}
    end,
  },
}
