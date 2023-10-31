-- codicons stolen from onsails/lspkind.nvim
local codicons = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
}

if vim.g.vscode then
  return {}
else
  return {
    {
      'williamboman/mason.nvim',
      build = ':MasonUpdate',
      config = true,
    },

    { 'neovim/nvim-lspconfig', },
    {
      'folke/neodev.nvim',
      config = true,
    },
    {
      'onsails/lspkind.nvim',
      config = function()
        require('lspkind').init({
          mode = 'symbol',
          preset = 'codicons'
        })
      end,
      event = 'VeryLazy',
    },
  }
end
