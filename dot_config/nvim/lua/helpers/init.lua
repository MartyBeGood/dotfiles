local helpers = {}

function helpers.cmdify(thing)
  return "<cmd>"..thing.."<cr>"
end

return helpers

