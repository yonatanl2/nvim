return {
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		ft = "css",
		config = function()
			require("colorizer").setup()
		end,
	},
}
