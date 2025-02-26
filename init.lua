vim.g.mapleader = " "
vim.opt.number = true
require("config.lazy")
require("config.telescope")
require("config.lsp")
require("config.cmp")
require("config.barbar")
require("config.gitsigns")
require("config.dotenv")
require("config.dap")
require("config.easy-align")
require("config.null-ls")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})
