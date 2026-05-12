local snacks = require("snacks")
snacks.setup({
	terminal = {
		enabled = true,
		win = {
			position = "float",
			border = "rounded",
		},
	},
})

-- [Terminal] ----------

-- snacks.terminal()
vim.keymap.set({ "n", "t" }, "<C-]>", snacks.terminal.toggle, { desc = "Snacks find files" })

-- [Picker] ----------

vim.keymap.set("n", "<leader>ff", snacks.picker.files, { desc = "Snacks find files" })

vim.keymap.set("n", "<leader>fg", snacks.picker.grep, { desc = "Snacks live grep" })

vim.keymap.set("n", "<leader>fb", snacks.picker.buffers, { desc = "Snacks buffers" })

vim.keymap.set("n", "<leader>fh", snacks.picker.help, { desc = "Snacks help" })

vim.keymap.set("n", "<leader>fs", snacks.picker.lsp_symbols, { desc = "Snacks LSP Symbols" })

vim.keymap.set("n", "<leader>fe", snacks.picker.diagnostics, { desc = "Snacks LSP diagnostics" })

vim.keymap.set("n", "<leader>fr", snacks.picker.lsp_references, { desc = "Snacks LSP references" })
