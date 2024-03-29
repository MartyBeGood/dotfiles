return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'folke/which-key.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      local table_merge = require('plugins.lsp.tables').table_merge

      -- auto-install servers mentioned in table above
      mason_lspconfig.setup {
        ensure_installed = require('plugins.lsp.tables').auto_install_with_mason,
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Format on save if the LS supports it
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                timeout_ms = 500,
                formatting_options = {
                  trimFinalNewlines = true,
                  insertFinalNewline = true,
                  trimTrailingWhitespace = true,
                }
              })
            end
          })
        end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        require('which-key').register(require('plugins.which-key.lsp-binds'), { buffer = bufnr })
      end

      local server_settings = require('plugins.lsp.tables').server_settings
      for server_name, config in pairs(server_settings) do
        lspconfig[server_name].setup(table_merge({ capabilities = capabilities, on_attach = on_attach }, config or {}))
      end
    end
  }
}
