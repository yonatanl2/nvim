return {
  {
    "almo7aya/openingh.nvim",
    event = "VeryLazy",
    opt = function()
      vim.keymap.set("n", "gho", ":OpenInGHFileLines")
    end,
  },
}
