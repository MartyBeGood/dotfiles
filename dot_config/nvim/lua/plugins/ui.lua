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
          theme = require('ofirkai.statuslines.lualine').theme, -- Will break lazy loading if not in a function
          disabled_filetypes = {
            'NvimTree'
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline"
      },
      messages = {
        enabled = true,
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = true,
          view = nil
        },
        signature = {
          enabled = true,
          view = "hover"
        }
      },
      presets = {
        long_message_to_split = true
      }
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
      char = "┆",
      context_char = "┆",
      use_treesitter = false,
      show_current_context = true,
      show_current_context_start = true,
      filetype_exclude = {
        'help',
        'dashboard',
        'git',
        'markdown',
        'text',
        'terminal',
        'lspinfo',
        'packer',
        'NvimTree',
      },
      buftype_exclude = {
        'terminal',
        'nofile',
        'TelescopePrompt'
      },
    }
  }
}
