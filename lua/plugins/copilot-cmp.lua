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
