local function ollama_host()
  if vim.fn.hostname() == "devbox" then
    return "http://10.11.12.50:11434"
  else
    return "http://localhost:11434"
  end
end

local function preferred_tui()
  local val = vim.fn.getenv("NVIM_PREFER_CLAUDE")
  if val == vim.NIL or val == "" or val == "0" or val == "false" or val == "no" then return "opencode" end
  return "claude"
end

return {
  {
    "milanglacier/minuet-ai.nvim",
    opts = {
      provider = "openai_fim_compatible",
      n_completions = 1,
      context_window = 8192,
      throttle = 0, -- No need to throttle AND debounce my local LLM. If it causes trouble, revert to the default of 500
      debounce = 200,
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "Ollama (Qwen2.5-coder)",
          end_point = ollama_host() .. "/v1/completions",
          model = "qwen2.5-coder:7b",
          optional = {
            max_tokens = 256, -- max length of generated text
            top_p = 0.9, -- Tem
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { "*" },
        keymap = {
          accept = "<M-y>",
          accept_line = "<M-l>",
          next = "<M-n>",
          prev = "<M-p>",
          dismiss = "<M-e>",
        },
        show_on_completion_menu = true,
      },
    },
  },

  {
    "folke/sidekick.nvim",
    keys = {
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle({ name = preferred_tui() }) end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<M-.>",
        function() require("sidekick.cli").focus({ name = preferred_tui() }) end,
        desc = "Sidekick Focus",
        mode = { "n", "t", "i", "x" },
      },
    },
  },
}
