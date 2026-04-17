require("textcase").setup {}
require("telescope").load_extension("textcase")
vim.keymap.set({"n", "v"}, "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
