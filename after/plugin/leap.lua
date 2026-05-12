vim.keymap.set({ "n", "x", "o" }, "<CR>", "<Plug>(leap)")
vim.keymap.set("n", "<S-CR>", "<Plug>(leap-from-window)")

vim.keymap.set({ "v", "x", "o" }, "an", function()
	require("leap.treesitter").select({
		opts = require("leap.user").with_traversal_keys("n", "N"),
	})
end)
