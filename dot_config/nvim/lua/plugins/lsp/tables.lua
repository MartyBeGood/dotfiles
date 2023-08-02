-- TODO: Unified table for mason-managed and manual servers. Some can be installed through mason, some need shadowenv/other stuff/are provided through project config
-- Something like
-- local servers = {
--   lspconfig_name = {
--     auto_install = [nil | false | true | mason_package_name]
--     config = {}
--   }
-- }
local m = {}

-- lspconfig names of servers you want to auto-install with mason. Make sure these also show up in the server_settings table below or they won't be configured
m.auto_install_with_mason = {
  'bashls',
  'cssls',
  'emmet_ls',
  'diagnosticls',
  'html',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'tsserver',
}

-- Server configs. Assumes these servers are present. Either through Mason (see above) or otherwise
m.server_settings = {
  bashls = {},
  cssls = {},
  emmet_ls = {},
  efm = {
    init_options = { documentFormatting = true, documentRangeFormatting = true },
    filetypes = { "slim" },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        slim = {
          {
            rootMarkers = { ".git/" },
            lintCommand = "slim-lint --reporter emacs --stdin-file-path ${INPUT}",
            lintStdin = true,
            lintFormats = { "%f:%l:%c: %m" },
            lintIgnoreExitCode = true,
          }
        }
      }
    }
  },
  gopls = {},
  html = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
          keywordSnippet = "Replace",
        },
        workspace = {
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      }
    }
  },
  pyright = {},
  rubocop = {},
  rust_analyzer = {},
  solargraph = {
    settings = {
      solargraph = {
        diagnostics = false -- Rubocop does this better
      }
    },
    init_options = {
      formatting = false -- Rubocop does this better
    }
  },
  tsserver = {},
}

m.table_merge = function(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

return m
