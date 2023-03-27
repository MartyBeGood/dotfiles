return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash', 'c', 'cpp', 'css', 'go', 'html', 'json', 'lua', 'python', 'ruby', 'vim'
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      highlight = {
        -- `false` will disable the whole extension
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      endwise = {
        enable = true,
      }
    })
  end,
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag",
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
  }
}
