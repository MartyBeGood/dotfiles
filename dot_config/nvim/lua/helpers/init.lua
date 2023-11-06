local helpers = {}

function helpers.cmdify(thing)
  return "<cmd>" .. thing .. "<cr>"
end

function helpers.themed_telescope(picker, opts)
  opts = opts or {}

  -- some default changes to the theme
  opts.border = false

  local theme = require('telescope.themes').get_ivy(opts)
  return function() picker(theme) end
end

function helpers.cwd_in_git_repo()
  return vim.fn.system("git rev-parse --is-inside-work-tree") == "true\n"
end

return helpers
