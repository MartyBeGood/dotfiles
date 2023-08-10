return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },

      presets = {
        bottom_search = true,
        long_message_to_split = true,
      },

      cmdline = {
        enabled = true,
        view = "cmdline",
        format = {
          cmdline = {
            pattern = "^:",
            icon = "",
            lang = "vim",
          }
        }
      }
    }
  }
}
