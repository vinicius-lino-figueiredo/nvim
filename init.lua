vim.g.mapleader = " "
vim.opt.number = true
vim.opt.colorcolumn = "121"
vim.keymap.set("n", "<Leader>e", ":Ntree<CR>")
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
require("config.godap")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
})
