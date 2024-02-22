return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
  filetype = "java",
  opts = function(_, opts)
    local nls = require("null-ls")
    local root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])
    -- opts.root_dir = opts.root_dir or require("null-ls.utils").root_pattern(".null-ls-root", "gradlew", "mvnw", ".git")
    opts.root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "gradlew", "mvnw", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.diagnostics.checkstyle.with({
        extra_args = { "-c", root_dir .. "/config/checkstyle/checkstyle.xml" },
      }),
    })
  end,
}
