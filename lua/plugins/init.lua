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
}
