local defaults = {
  winopts = {
    border = "solid",
    preview = {
      border = "solid",
    },
  }
}
return {
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    opts = {
      border = "solid",
      preview = {
        border = "solid",
      },
    },
    keys = {
      { "<leader>s",        group = "search" },
      { "<leader><leader>", function() require("fzf-lua").files(defaults); end,     desc = "files" },
      { "<leader>sa",       function() require("fzf-lua").builtin(defaults); end,   desc = "fzf-lua builtins" },
      { "<leader>sg",       function() require("fzf-lua").live_grep(defaults); end, desc = "grep in project" },
      { "<leader>sh",       function() require("fzf-lua").helptags(defaults); end,  desc = "helptags" },
      { "<leader>sr",       function() require("fzf-lua").resume(defaults); end,    desc = "resume last search" },
      { "<leader>,",        function() require("fzf-lua").buffers(defaults); end,   desc = "Open buffers" },
      { "<leader>bb",       function() require("fzf-lua").buffers(defaults); end,   desc = "Open buffers" },
    },
  }
}
