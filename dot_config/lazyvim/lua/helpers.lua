return {
  get_env = function(name)
    local env_value = os.getenv(name)

    if not env_value then
      vim.notify("Could not get " .. name .. " from env", vim.log.levels.ERROR)
    end

    return env_value
  end,
}
