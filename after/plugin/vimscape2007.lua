require("vimscape2007").setup({ batch_size = 50 })
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = "Vimscape flush",
})
