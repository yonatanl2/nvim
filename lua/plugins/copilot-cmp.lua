return {
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      -- local lsp = require("lsp-zero")
      -- lsp.setup_nvim_cmp({
      -- 	preselect = "none",
      -- 	completion = {
      -- 		completeopt = "menu,menuone,noselect",
      -- 	},
      -- })
      -- lsp.setup()
      -- copilot_cmp.preselect = require("cmp.types").cmp.PreselectMode.None
      -- copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end
      copilot_cmp.setup({
        mapping = {
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if copilot_cmp.visible() and has_words_before() then
              copilot_cmp.select_next_item({ behavior = copilot_cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
        },
      })
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require("lazyvim.util").lsp.on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter({})
        end
      end)
    end,
  },
}
