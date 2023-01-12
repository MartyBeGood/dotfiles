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

return helpers
