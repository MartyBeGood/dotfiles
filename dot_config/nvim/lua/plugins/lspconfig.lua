-- LSP config

require("mason").setup()
require("mason-lspconfig").setup()
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
  }
})

require("mason-null-ls").setup()

local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

-- Diagnostic options, see: `:help vim.diagnostic.config`
vim.diagnostic.config({ virtual_text = true })

-- Add additional capabilities supported by nvim-cmp
-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
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
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local cmdify = require('helpers').cmdify
  require('which-key').register({
    g = {
      name = "Go to...",
      D = { cmdify('lua vim.lsp.buf.declaration()'), "Declaration" },
      d = { cmdify('Telescope lsp_definitions'), "Definition" },
      h = { cmdify('lua vim.lsp.buf.hover()'), "Hover" },
      i = { cmdify('lua vim.lsp.buf.implementation()'), "Implementation" },
      y = { cmdify('Telescope lsp_type_definitions'), "Type definition" },
      r = { cmdify('Telescope lsp_references'), "References" },
    },
    ["<space>"] = {
      c = {
        name = "Code...",
        a = { cmdify('lua vim.lsp.buf.code_action()'), "LSP code action" },
        f = { cmdify('lua vim.lsp.buf.format({async = true})'), "LSP Format" },
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
    },
  }, {
    buffer = bufnr
  })
end

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
local root_dir = function()
  return vim.fn.getcwd()
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches.
-- Add your language server below:
local servers = { 'bashls', 'solargraph', 'gopls', 'pyright', 'html', 'cssls', 'tsserver' }

-- Call setup
lspconfig['sumneko_lua'].setup {
  on_attach = on_attach,
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        enable = false,
      }
    }
  }
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
  }
end


-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmpa


local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

if cmp == nil then
  return
end

-- Workaround for a weirdly-styled completion window in ofirkai
local cmpdesign = {
  border = nil,
  zindex = 1001,
  winhighlight = 'Normal:NormalFloat,CursorLine:Visual,Search:None',
}

local cmpwindows = {
  completion = cmpdesign,
  documentation = cmpdesign
}

cmp.setup {
  -- Load snippet support
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = cmpwindows,

  -- Completion settings
  completion = {
    completeopt = 'menu,menuone,noselect',
    keyword_length = 2,
  },

  preselect = cmp.PreselectMode.None,

  -- Key mapping
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    -- Tab mapping
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },

  -- Load sources, see: https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50
    })
  }
}
