return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false },
          runner = "unittest",
          python = "/Users/yonatanlevy/.pyenv/shims/python",
          is_test_file = function(file_path)
            return file_path:sub(-#"test.py") == "test.py"
          end,
        },
      },
    },
  },
}
