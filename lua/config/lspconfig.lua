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
	bashls = {},
	ols = {
		init_options = {
			checker_args = "-strict-style",
		},
		on_attach = function(client, bufnr)
			-- Força o checker a rodar ao abrir o arquivo
			vim.defer_fn(function()
				client:notify("textDocument/didSave", {
					textDocument = { uri = vim.uri_from_bufnr(bufnr) },
				})
			end, 100)
		end,
		before_init = function(_, config)
			local ols_json = config.root_dir .. "/ols.json"
			if vim.fn.filereadable(ols_json) == 0 then
				local content = [[{
  "$schema": "https://raw.githubusercontent.com/DanielGavin/ols/master/misc/ols.schema.json",
  "profile": "default",
  "profiles": [{ "name": "default", "checker_path": ["."] }]
}]]
				vim.fn.writefile(vim.split(content, "\n"), ols_json)
			end
		end,
	},
}
