return {
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
      }
    }
  }
}
