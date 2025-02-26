return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-]>]], -- Atalho para abrir/fechar o terminal
				direction = "float", -- Pode ser "horizontal", "vertical", "float" ou "tab"
				shade_terminals = true, -- Deixa o terminal com um tom mais escuro
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
