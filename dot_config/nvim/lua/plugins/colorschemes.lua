return {
  -- NOTE: to future self: Just leave it as is unless monokai-nightasty is broken. You've tried and failed to find a better one many times.

  -- Themes I've tried and didn't like enough to keep:
  -- "marko-cerovac/material.nvim", -- Material theme. Toggling doesn't work right.
  -- "EdenEast/nightfox.nvim", -- Collection of nice-looking themes, but doesn't support background toggling.
  -- "projekt0n/github-nvim-theme", -- GitHub theme. Light mode is a bit harsh, dark mode is nice.
  {
    "mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup({
        italic_comments = true,
        underline_links = true,
        group_overrides = {
          NeoTreeDimText = { fg = require("vscode.colors").get_colors().vscCursorDark, bg = "NONE" },
        },
      })
    end,
  },
  {
    "polirritmico/monokai-nightasty.nvim", -- Monokai with a neutral grey background.
    opts = {
      dim_inactive = false,

      floats = "dark",
      sidebars = "dark",
      on_colors = function(colors)
        -- This function is run after the theme extracts all kinds of extra colors
        local is_light = vim.o.background == "light"
        if is_light then
          colors.blue = "#428ba6"
          colors.green = "#469c6c"
          colors.magenta = "#d34d75"
          colors.orange = "#d3643a"
          colors.yellow = "#c17c23"
          colors.purple = "#7257ba"
        else
          colors.blue = "#5ad4e6" -- accent5
          colors.green = "#7bd88f" -- accent4
          colors.magenta = "#fc618d" -- accent1
          colors.orange = "#fd9353" -- accent2
          colors.purple = "#948ae3" -- accent6
          colors.yellow = "#fce566" -- accent3

          colors.blue_alt = "#5ad4e6"
          colors.green_alt = "#7bd88f"
          colors.green_light = "#a9dc76" -- (Classic Monokai Green for variety)
          colors.red = "#fc618d" -- accent1
          colors.yellow_alt = "#fce566"
        end

        colors.git.add = colors.green -- accent4
        colors.git.change = colors.blue -- accent2
        colors.git.delete = colors.red -- accent1

        -- copied from the theme itself to re-do the extraction
        -- Default values for functions util.darken() and util.lighter()
        local utils = require("monokai-nightasty.utils")
        utils.bg = colors.bg
        utils.fg = colors.fg

        colors.border = colors.blue
        colors.border_highlight = colors.fg

        -- Statusline
        colors.bg_statusline = is_light and utils.darken(colors.bg, 0.93, colors.fg) or colors.grey_darker
        colors.fg_statusline = colors.fg_dark

        -- Sidebar and Floats

        -- Set the background for the current line (current cursor position)
        colors.bg_highlight = utils.darken(colors.bg, 0.9, colors.fg) -- (0.97 for #313131)

        colors.bg_visual = is_light and colors.charcoal or colors.grey_darker
        colors.bg_search = colors.yellow
        colors.fg_search = is_light and colors.white or colors.black
        colors.fg_sidebar = colors.fg_dark

        -- For lsp floats messages, git, diffs, etc.
        colors.error = colors.red
        colors.hint = colors.green_alt
        colors.info = colors.blue_alt
        colors.note = utils.blend(colors.orange, colors.yellow, 0.6)
        colors.todo = colors.purple
        colors.warning = colors.orange
        colors.diff = {
          add = utils.darken(colors.green, 0.15),
          delete = utils.darken(colors.red, 0.15),
          change = utils.darken(colors.blue_alt, 0.15),
          text = utils.darken(colors.blue_alt, 0.3),
        }

        -- Lualine
        colors.lualine = {
          normal_bg = is_light and colors.green_light or colors.green,
          normal_fg = is_light and colors.white or colors.black,
          command_fg = is_light and utils.import_color("dark", "green") or colors.green,
        }

        -- Rainbow colors (for color_headers, rainbow delimiters and other plugins)
        colors.rainbow = {
          colors.fg,
          colors.yellow,
          colors.orange,
          colors.red,
          colors.purple,
          colors.blue,
        }
      end,
    },
  },
}
