return {
  handlers = {
    -- TODO: Don't suppress everything, just the stuff that's annoying
    ["$/progress"] = function(_, result, ctx) end, -- Disable progress messages (Otherwise you get 3 messages per keystroke).
  },
}
