vim.g.mapleader = " "
vim.opt.number = true
vim.opt.colorcolumn = "81"
vim.keymap.set("n", "<Leader>e", ":Ntree<CR>")
require("config.lazy")
require("config.telescope")
require("config.lsp")
require("config.cmp")
require("config.gitsigns")
require("config.dotenv")
require("config.dap")
require("config.easy-align")
require("config.null-ls")
require("config.godap")
require("config.schemastore")
require("config.todo-comments")
require("config.lualine")
require("config.nvim-treesitter-textobjects")
require("config.toggleterm")
require("config.harpoon")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
})
