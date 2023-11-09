return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    -- require('mini.comment').setup()
    require('mini.indentscope').setup({
      draw = {
        delay = 0,
        animation = function() return 0 end,
      },
      options = {
        border = 'top',
        try_as_border = true
      }
    })
    -- autocmd that sets vim.b.miniindentscope_disable to true for filetypes NvimTree fugitive gitcommit toggleterm
    augroup('miniindentscope', { clear = true })
    autocmd('FileType', {
      group = 'miniindentscope',
      pattern = {
        'NvimTree',
        'fugitive',
        'gitcommit',
        'toggleterm'
      },
      callback = function()
        vim.api.nvim_buf_set_var(vim.api.nvim_get_current_buf(), 'miniindentscope_disable', true)
      end
    })
    require('mini.move').setup()
    require('mini.pairs').setup()
    require('mini.operators').setup()
    require('mini.splitjoin').setup({
      mappings = {
        toggle = 'gs',
        split = 'gS',
        join = 'gJ',
      }
    })
  end
}
