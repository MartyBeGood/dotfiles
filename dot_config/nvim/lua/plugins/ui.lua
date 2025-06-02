return {
  { -- Colorscheme
    "polirritmico/monokai-nightasty.nvim",
    cond = not vim.g.vscode,
    lazy = false,
    opts = {
      on_colors = function(colors)
        if vim.o.background == "light" then
          colors.blue = "#0043c3"
          colors.green = "#207000"
          colors.magenta = "#d0325c"
          colors.orange = "#cf3000"
          colors.yellow = "#df6f00"
          colors.git.add = "#30a000"
          colors.git.change = "#df6f00"
          colors.git.remove = "cf3000"
        else
          colors.magenta = "#e34481"
        end
      end,

      on_highlights = function(highlights, colors)
        highlights["VertSplit"] = { fg = colors.bg_darker }
        highlights["WinSeparator"] = { fg = colors.bg_darker }
      end
    },
    config = function(_, opts)
      require("monokai-nightasty").setup(opts)
      vim.cmd.colorscheme("monokai-nightasty")
    end
  },

  { -- icons for everything
    "echasnovski/mini.icons",
    cond = not vim.g.vscode,
    config = function(_, opts)
      require("mini.icons").setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end
  },

  { -- LSP messages
    "j-hui/fidget.nvim",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    opts = {}
  },

  { -- various goodies (Indent guides, Toggles)
    "folke/snacks.nvim",
    cond = not vim.g.vscode,
    lazy = false,
    opts = {
      indent = {
        indent = {
          char = "▏",
        },
        animate = { enabled = false },
        chunk = {
          enabled = false, -- Looks cool, but I don't think it's more useful than scope
        },
      },
      toggle = {},
    },
  },

  { -- uncomplicated folds
    "kevinhwang91/nvim-ufo",
    cond = not vim.g.vscode,
    dependencies = {
      "kevinhwang91/promise-async"
    },
    opts = {
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end,

      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end
    },
  },

  { -- Show me my keymaps
    "folke/which-key.nvim",
    event = "VeryLazy",
    cond = false,
    opts = {
      spec = {
        { "<leader>c", group = "code" },
        { "<leader>f", group = "files" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "test" },
        { "<leader>u", group = "toggles" }
      }
    },
  },
  {
    "echasnovski/mini.clue",
    cond = not vim.g.vscode,
    config = function()
      local clue = require("mini.clue")

      clue.setup({
        window = {
          delay = 100,
        },
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          clue.gen_clues.marks(),
          clue.gen_clues.registers(),
          clue.gen_clues.windows(),
          clue.gen_clues.z(),
          { mode = 'n', keys = "<leader>c", desc = "code" },
          { mode = 'n', keys = "<leader>f", desc = "files" },
          { mode = 'n', keys = "<leader>s", desc = "search" },
          { mode = 'n', keys = "<leader>t", desc = "tests" },
          { mode = 'n', keys = "<leader>u", desc = "toggles" }
        }
      })
    end
  },

  { -- Statusline
    "nvim-lualine/lualine.nvim",
    cond = not vim.g.vscode,
    opts = {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = " ",
              readonly = " ",
              unnamed = "(unnamed)",
              newfile = " "
            },
          },
        },
        lualine_y = {
          {
            "lsp_status",
            icon = "",
            symbols = {
              done = " "
            },
          },
        },
      },
    }
  },

  { -- General UI overhaul
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      presets = {
        bottom_search = true,
        long_message_to_split = true,
      },
      cmdline = {
        enabled = true,
        view = "cmdline"
      },
      messages = {
        enabled = true,
        view = "mini",
        view_error = "mini",
        view_warn = "mini",
        view_search = "virtualtext"
      }
    }
  }
}
