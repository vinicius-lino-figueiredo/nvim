local ecolog = require("ecolog")

ecolog.setup({
	integrations = {
		nvim_cmp = false,
	},
	-- Enables shelter mode for sensitive values
	shelter = {
		configuration = {
			-- Character used for masking
			mask_char = "*",
			-- Optional: fixed length for masked portion (defaults
			-- to value length)
			mask_length = nil,
			-- Skip masking comment lines in environment files
			-- (default: false)
			skip_comments = false,
		},
		modules = {
			cmp = true, -- Enabled to mask values in completion
			peek = false, -- Enable to mask values in peek view
			files = true, -- Enabled to mask values in file buffers
			telescope = false, -- Enable to mask values in telescope integration
			telescope_previewer = false, -- Enable to mask values in telescope preview buffers
			fzf = false, -- Enable to mask values in fzf picker
			fzf_previewer = false, -- Enable to mask values in fzf preview buffers
			snacks_previewer = false, -- Enable to mask values in snacks previewer
			snacks = false, -- Enable to mask values in snacks picker
		},
	},
})

vim.keymap.set("n", "<leader>pp", ":EcologShelterLinePeek<CR>", {
	desc = "Ecolog peek variable",
})
