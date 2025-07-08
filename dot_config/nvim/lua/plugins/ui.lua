return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, default_opts)
      local my_opts = {
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = false,
          length = 0,
        },
        sections = {
          lualine_x = {
            {
              function()
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()

                local server_names = {}
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    table.insert(server_names, client.name)
                  end
                end

                if next(server_names) == nil then
                  return ""
                end

                return "󰒋 " .. table.concat(server_names, ", ")
              end,
            },
          },
          lualine_y = {
            { "encoding" },
            { "fileformat" },
          },
          lualine_z = {
            {
              "progress",
              separator = " ",
              padding = { left = 1, right = 0 },
            },
            {
              "location",
              separator = " ",
              padding = { left = 0, right = 1 },
            },
            { "selectioncount" },
          },
        },
      }

      local opts = vim.tbl_deep_extend("force", default_opts, my_opts)

      table.remove(opts.sections.lualine_c, table.maxn(opts.sections.lualine_c) - 1)
      table.insert(
        opts.sections.lualine_c,
        table.maxn(opts.sections.lualine_c),
        { LazyVim.lualine.pretty_path({ length = 0 }) }
      )

      return opts
    end,
  },

  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
      notify = {
        view = "mini",
      },
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
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
    },
  },
}
