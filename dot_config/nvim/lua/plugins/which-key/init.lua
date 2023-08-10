return {
  "folke/which-key.nvim",
  event = 'BufEnter',
  config = function()
    local wk = require('which-key')
    local helpers = require('helpers')
    local cmdify = helpers.cmdify
    local telescope_builtin = require('telescope.builtin')
    local themed_telescope = require('helpers').themed_telescope

    local git_files_or_all_files = function()
      if helpers.cwd_in_git_repo() then
        return themed_telescope(telescope_builtin.git_files)
      else
        return themed_telescope(telescope_builtin.find_files)
      end
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
        ["<space>"] = { git_files_or_all_files(), "Find Files" },
        b = {
          name = "Buffer...",
          b = { themed_telescope(telescope_builtin.buffers), "Switch buffers" },
          d = {
            name = "delete...",
            d = { cmdify("BDelete this"), "current buffer" },
            D = { cmdify("BDelete! this"), "current buffer forcefully" },
            h = { cmdify("BDelete hidden"), "hidden buffers" },
            H = { cmdify("BDelete! hidden"), "hidden buffers forcefully" },
          }
        },
        c = {
          s = { cmdify("TSJSplit"), "Split thing under cursor" },
          j = { cmdify("TSJJoin"), "Join thing under cursor" },
          c = { cmdify("TSJToggle"), "Toggle split/join thing under cursor" }
        },
        f = { themed_telescope(telescope_builtin.find_files), "Find Files" },
        l = {
          name = "List..",
          d = { cmdify("Trouble document_diagnostics"), "Diagnostics in file" },
          D = { cmdify("Trouble workspace_diagnostics"), "Diagnostics in workspace" },
          r = { cmdify("Trouble lsp_references"), "References" },
        },
        g = {
          name = "Git...",
          f = { themed_telescope(telescope_builtin.git_files), "Files in Git" },
          g = { cmdify("Git"), "Overview" },
          h = { cmdify("VGit buffer_history_preview"), "History of current buffer" },
          B = { cmdify("VGit toggle_live_blame"), "Toggle blame lens" },
          s = { cmdify("Git sync"), "pull, then push" }
        },
        o = {
          name = "Open...",
          f = { cmdify("NvimTreeToggle"), "File Browser" },
          F = { cmdify("NvimTreeFindFile"), "File Browser at current file" },
          t = { cmdify("ToggleTerm"), "Terminal" },
        },
        s = {
          name = "Search...",
          s = { themed_telescope(telescope_builtin.grep_string), "String under cursor" },
          c = { themed_telescope(telescope_builtin.resume), "Resume last search" },
          g = { themed_telescope(telescope_builtin.live_grep), "String in project" },
          h = { themed_telescope(telescope_builtin.help_tags), "Vim Helptags" },
        },
        t = {
          name = "Tests...",
          t = { cmdify("TestNearest"), "Run nearest" },
          f = { cmdify("TestFile"), "Run all in file" },
          l = { cmdify("TestLast"), "Run last" },
          s = { cmdify("TestSuite"), "Run full suite" },
        },
        w = {
          name = "Window...",
          w = { cmdify("WinShift"), "Enter move mode" },
          s = { cmdify("WinShift swap"), "Swap current window with..." },
          h = { cmdify("WinShift left"), "Move current window left" },
          j = { cmdify("WinShift down"), "Move current window down" },
          k = { cmdify("WinShift up"), "Move current window up" },
          l = { cmdify("WinShift right"), "Move current window right" },
          H = { cmdify("WinShift far_left"), "Move current window all the way left" },
          J = { cmdify("WinShift far_down"), "Move current window all the way down" },
          K = { cmdify("WinShift far_up"), "Move current window all the way up" },
          L = { cmdify("WinShift far_right"), "Move current window all the way right" },
        }
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
