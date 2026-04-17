return {
	adapters = {
		["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
				args = { "${port}" },
			},
		},
	},
	configs = {
		javascript = {
			{
				type = "pwa-node",
				name = "Launch current file in new node process",
				request = "launch",
				program = "${file}",
			},

			{
				type = "pwa-node",
				request = "launch",
				name = "Mocha Test",
				runtimeExecutable = "npx",
				runtimeArgs = { "mocha", "${file}" },
				cwd = vim.fn.getcwd(),
				console = "integratedTerminal",
			},
		},
	},
}
