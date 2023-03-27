-- LSP & Autocomplete are intertwined.
-- Best to set them up together after having made sure the modules are present.
-- This module provides a setup method to do just that.

local M = {}

M.setup = function()
  local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Highlighting references
    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_exec([[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]], false)
    end

    -- Format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function() vim.lsp.buf.format() end
      })
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local cmdify = require('helpers').cmdify
    local themed_telescope = require('helpers').themed_telescope

    require('which-key').register({
      g = {
        name = "Go to...",
        D = { cmdify('lua vim.lsp.buf.declaration()'), "Declaration" },
        d = { themed_telescope(require('telescope.builtin').lsp_definitions), "Definition" },
        h = { cmdify('lua vim.lsp.buf.hover()'), "Hover" },
        i = { cmdify('lua vim.lsp.buf.implementation()'), "Implementation" },
        y = { themed_telescope(require('telescope.builtin').lsp_type_definitions), "Type definition" },
        r = { themed_telescope(require('telescope.builtin').lsp_references), "References" },
      },
      ["<space>"] = {
        c = {
          name = "Code...",
          a = { cmdify('lua vim.lsp.buf.code_action()'), "LSP code action" },
          f = { cmdify('lua vim.lsp.buf.format()'), "LSP Format" },
          r = {
            name = "Refactor...",
            r = { cmdify('lua vim.lsp.buf.rename()'), "Rename symbol" },
          },
        },
        d = {
          name = "Diagnostics...",
          d = { cmdify('lua vim.diagnostic.open_float()'), "Line diagnostics" },
          n = { cmdify('lua vim.diagnostic.goto_next()'), "Next" },
          p = { cmdify('lua vim.diagnostic.goto_prev()'), "Previous" },
          l = { cmdify("Trouble document_diagnostics"), "Diagnostics in file" },
        },
        s = {
          name = "Search...",
          s = { themed_telescope(require('telescope.builtin').lsp_dynamic_workspace_symbols), "Symbol in workspace" }
        }
      },
    }, {
      buffer = bufnr
    })
  end
  -- SERVER CONFIG GOES HERE

  -- TODO: Unified table for mason-managed and manual servers. Some can be installed through mason, some need shadowenv/other stuff/are provided through project config
  -- Something like
  -- local servers = {
  --   lspconfig_name = {
  --     auto_install = [nil | false | true | mason_package_name]
  --     config = {}
  --   }
  -- }
  local servers = {
    bashls = {},
    cssls = {},
    emmet_ls = {},
    html = {},
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
    lua_ls = {
      -- mason-name = lua-language-server
      workspace = {
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
    yamlls = {},
  }

  local manually_installed_servers = {
    solargraph = {},
    gopls = {},
  }

  -- Actual work starts here
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  require('mason').setup()

  local lspconfig = require('lspconfig')
  local mason_lspconfig = require('mason-lspconfig')

  -- auto-install servers mentioned in table above
  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers)
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      lspconfig[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
      }
    end
  }

  for server_name, config in pairs(manually_installed_servers) do
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = config,
    })
  end

  local cmp = require('cmp')
  local luasnip = require('luasnip')

  luasnip.config.setup({})

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
      }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol',
        maxwidth = 50,
        ellipsis_char = '...'
      })
    }
  })
end

return M
