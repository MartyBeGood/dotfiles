local helpers = {}

function helpers.cmdify(thing)
  return "<cmd>" .. thing .. "<cr>"
end

function helpers.themed_telescope(picker)
  local theme = require('telescope.themes').get_ivy({
    border = false,
  })
  return function() picker(theme) end
end

function helpers.cwd_in_git_repo()
  return vim.fn.system("git rev-parse --is-inside-work-tree") == "true\n"
end

return helpers
