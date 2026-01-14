return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
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
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
			})
			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "lewis6991/gitsigns.nvim" },
	{ "ellisonleao/dotenv.nvim" },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "nvim-neotest/nvim-nio" },
	{ "junegunn/vim-easy-align" },
	{ "nvimtools/none-ls.nvim" },

	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{ "b0o/schemastore.nvim" },
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"ga", -- Default invocation prefix
			{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
		},
		cmd = {
			-- NOTE: The Subs command name can be customized via the option "substitude_command_name"
			"Subs",
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseStartReplacingCommand",
		},
		-- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
		-- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
		-- available after the first executing of it or after a keymap of text-case.nvim has been used.
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"mason-org/mason.nvim",
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lukas-reineke/virt-column.nvim",
		opts = {},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			-- cfg options
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
		},
		lazy = false,
	},
	{
		"ph1losof/ecolog.nvim",
		branch = "v1",
		-- Optional: you can add some keybindings
		keys = {
			{ "<leader>ge", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
			{ "<leader>pp", "<cmd>EcologShelterLinePeek<cr>", desc = "Ecolog peek variable" },
			{ "<leader>es", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
		},
		-- Lazy loading is done internally
		lazy = false,
		-- config = function()
		-- 	-- require("telescope").load_extension("ecolog")
		-- end,
		opts = {
			integrations = { nvim_cmp = true },
			-- Enables shelter mode for sensitive values
			shelter = {
				configuration = {
					-- Partial mode configuration:
					-- false: completely mask values (default)
					-- true: use default partial masking settings
					-- table: customize partial masking
					-- partial_mode = false,
					-- or with custom settings:
					partial_mode = false,
					mask_char = " ", -- Character used for masking
					mask_length = nil, -- Optional: fixed length for masked portion (defaults to value length)
					skip_comments = true, -- Skip masking comment lines in environment files (default: false)
				},
				modules = {
					cmp = true, -- Enabled to mask values in completion
					peek = false, -- Enable to mask values in peek view
					files = true, -- Enabled to mask values in file buffers
					telescope = false, -- Enable to mask values in telescope integration
					telescope_previewer = true, -- Enable to mask values in telescope preview buffers
					fzf = false, -- Enable to mask values in fzf picker
					fzf_previewer = false, -- Enable to mask values in fzf preview buffers
					snacks_previewer = false, -- Enable to mask values in snacks previewer
					snacks = false, -- Enable to mask values in snacks picker
				},
			},
			-- true by default, enables built-in types (database_url, url, etc.)
			types = true,
			path = vim.fn.getcwd(), -- Path to search for .env files
			preferred_environment = "development", -- Optional: prioritize specific env files
			-- Controls how environment variables are extracted from code and how cmp works
			provider_patterns = true, -- true by default, when false will not check provider patterns
		},
	},
	{ "rcarriga/nvim-notify" },
}
