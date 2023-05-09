return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    event = "UIEnter",
    config = function()
      require('lualine').setup({
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          -- theme = require('ofirkai.statuslines.lualine').theme,
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
}
