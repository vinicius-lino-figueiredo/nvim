return {
	omnisharp = {
		cmd = { vim.fn.stdpath("data") .. "/mason/bin/OmniSharp" },
		-- opções básicas aqui
		on_attach = function(client, bufnr)
			-- keymaps, etc
		end,
		flags = {
			debounce_text_changes = 150,
		},
	},
	gopls = {},
	ts_ls = {
		on_attach = function(_, bufnr)
			vim.api.nvim_set_option_value("tabstop", 2, { buf = bufnr })
			vim.api.nvim_set_option_value("shiftwidth", 2, { buf = bufnr })
			vim.api.nvim_set_option_value("softtabstop", 2, { buf = bufnr })
			vim.api.nvim_set_option_value("expandtab", true, { buf = bufnr })
		end,
	},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	dockerls = {},
	clangd = {},
	lemminx = {},
}
