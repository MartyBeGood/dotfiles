return {
  "folke/which-key.nvim",
  event = 'BufEnter',
  config = function()
    local wk = require('which-key')
    local helpers = require('helpers')
    local cmdify = helpers.cmdify
    local telescope_builtin = require('telescope.builtin')
    local themed_telescope = require('helpers').themed_telescope

    local plug = function(cmd)
      return "<Plug>(" .. cmd .. ")"
    end

    local all_files = function()
      return themed_telescope(
        telescope_builtin.find_files,
        { find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*', '--no-ignore-vcs' } }
      )
    end

    wk.setup({
      plugins = {
        registers = false,
      },
      key_labels = {
        ["<space>"] = "SPC",
        ["<tab>"] = "TAB",
      }
    })

    local termcodes = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end


    wk.register({
      ["<space>"] = {
        ["<space>"] = { themed_telescope(telescope_builtin.find_files), "Find Files in project" },
        b = {
          name = "Buffer...",
          b = { themed_telescope(telescope_builtin.buffers), "Switch buffers" },
        },
        f = { all_files(), "Find ALL Files in working dir" },
        g = {
          name = "Git...",
          f = { themed_telescope(telescope_builtin.git_files), "Files in Git" },
          g = { cmdify("Git"), "Overview" },
          h = { cmdify("DiffviewFileHistory %"), "History of current buffer" },
          B = { cmdify("Gitsigns toggle_current_line_blame"), "Toggle blame lens" },
          s = { cmdify("Git sync"), "pull, then push" },
        },
        n = {
          name = "Nvim",
          g = {
            function()
              local result = vim.treesitter.get_captures_at_cursor()
              print(vim.inspect(result))
            end,
            "Print treesitter captures at cursor",
          },
        },
        o = {
          name = "Open...",
          f = { cmdify("NvimTreeToggle"), "File Browser" },
          F = { cmdify("NvimTreeFindFile"), "File Browser at current file" },
        },
        s = {
          name = "Search...",
          s = { themed_telescope(telescope_builtin.grep_string), "String under cursor" },
          c = { themed_telescope(telescope_builtin.resume), "Resume last search" },
          g = { themed_telescope(telescope_builtin.live_grep), "String in project" },
          h = { themed_telescope(telescope_builtin.help_tags), "Vim Helptags" },
        },
      },
      g = {
        p = {
          name = "gf in previous window",
          f = { cmdify("call gfriend#goto_cfile(winwidth(0) >=# 180 ? 'vsp' : 'sp')"), "File under cursor" },
          F = { cmdify("call gfriend#goto_cWORD(winwidth(0) >=# 180 ? 'vsp' : 'sp')"), "File&line under cursor" }
        }
      }
    })

    wk.register({ ["<esc>"] = { termcodes([[<C-\><C-n>]]), "Exit insert mode" } }, { mode = 't' })
  end
}
