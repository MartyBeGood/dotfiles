return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = "UIEnter",
    config = function()
      require('lualine').setup({
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            'NvimTree'
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            {
              'filename',
              path = 1,
              symbols = { modified = '󰛄', readonly = '' },
            },
          },
          lualine_x = {
            {
              function()
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()

                local server_names = {}
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    table.insert(server_names, client.name)
                  end
                end

                if next(server_names) == nil then
                  return ''
                end

                return '󰒋 ' .. table.concat(server_names, ', ')
              end,
            }
          },
          lualine_y = {
            'filetype',
            'encoding',
            'fileformat'
          },
          lualine_z = {
            'progress',
            'location',
            'searchcount'
          }
        },
      })
    end
  },
  {
    'folke/noice.nvim',
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    opts = {
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = true,
        },

      }
    }
  }
}
