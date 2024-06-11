return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.completion.completeopt = "menu,menuone,noinsert,noselect"

      opts.experimental.ghost_text = false -- Ghost text is for copilot suggestions

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })
    end,
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
        solargraph = {
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
          accept = "<M-Space>",
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
