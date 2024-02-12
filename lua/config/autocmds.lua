-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "java", "scala" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- Default tab size is 4, for some files we will set it as 2
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.cmd([[
--   autocmd FileType go setlocal tabstop=8 shiftwidth=8
--   autocmd FileType python setlocal tabstop=4 shiftwidth=4
--   autocmd FileType java setlocal tabstop=4 shiftwidth=4
--   autocmd FileType rust setlocal tabstop=4 shiftwdith=4
--   autocmd FileType javascript setlocal tabstop=4 shiftwidth=4
--   autocmd FileType scala setlocal tabstop=2 shiftwidth=2
-- ]])
