return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      slim = { "slimlint" },
    },

    linters = {
      ["slimlint"] = {
        cmd = "slim-lint",
        args = { "--reporter", "json", "--stdin-file-path", "%filepath" },
        stream = "stdin",
        ignore_exitcode = true,
        parser = function(output, _)
          local decoded = vim.fn.json_decode(output)
          local diagnostics = {}

          if decoded and decoded.files and decoded.files[1] and decoded.files[1].offenses then
            for _, offense in ipairs(decoded.files[1].offenses) do
              table.insert(diagnostics, {
                row = offense.location.line,
                col = offense.location.column or 1,
                message = offense.message,
                severity = offense.severity == "error" and vim.diagnostic.severity.ERROR
                  or vim.diagnostic.severity.WARN,
                source = "slim-lint",
              })
            end
          end

          return diagnostics
        end,
      },
    },
  },
}
