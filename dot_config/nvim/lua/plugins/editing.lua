return {
  { "numToStr/Comment.nvim",  config = true },                          -- nvim 0.10+ commenting is okay, but this is still an improvement
  { "echasnovski/mini.move",  config = true },                          -- Move things with Alt+direction
  { "kylechui/nvim-surround", config = true },                          -- vim-surround, but treesitter-aware
  { "echasnovski/mini.pairs", config = true, cond = not vim.g.vscode }, -- autoclose pairs
  {
    "echasnovski/mini.indentscope",
    opts = {
      options = {
        try_as_border = true, -- Check if current line is the border of an adjacent scope first
      }
    },

    config = function(_, opts)
      require("mini.indentscope").setup(opts)

      vim.g.miniindentscope_disable = true -- I use snacks for drawing indent guides
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "slim", "python", "yaml" },
        callback = function()
          vim.api.nvim_buf_set_var(vim.api.nvim_get_current_buf(), "miniindentscope_config",
            { options = { border = "top" } })
        end,
      })
    end
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "VeryLazy" },
    cond = not vim.g.vscode,
    cmd = "ConformInfo",
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true, lsp_format = "fallback" }) end, desc = "format file" },
    },
    opts = {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat then
          vim.notify("Not formatting because format-on-save is off globally.")
          return
        end
        if vim.b[bufnr].disable_autoformat then
          vim.notify("Not formatting because format-on-save is off for this buffer.")
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)

    Snacks.toggle.new({
      id = "format_on_save_global",
      name = "Format on save (global)",
      get = function() return not vim.g.disable_autoformat; end, -- reversing avoids defining the global/buffer-local variable ahead of time
      set = function(state) vim.g.disable_autoformat = not state; end,
    }):map("<leader>uF")

    Snacks.toggle.new({
      id = "format_on_save_buffer",
      name = "Format on save (buffer)",
      get = function() return not vim.b.disable_autoformat; end,
      set = function(state) vim.b.disable_autoformat = not state; end,
    }):map("<leader>uf")
  end
}
