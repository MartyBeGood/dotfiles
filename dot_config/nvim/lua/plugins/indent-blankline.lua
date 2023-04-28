return {
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
