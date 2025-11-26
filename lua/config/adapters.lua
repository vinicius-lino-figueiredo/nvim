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
		bashdb = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
			name = "bashdb",
		},
		go = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
			},
		},
	},
	configs = {
		go = {
			{
				type = "go",
				name = "Debug Package",
				request = "launch",
				program = "./${relativeFileDirname}",
				outputMode = "remote",
			},
			{
				type = "go",
				name = "Debug Package (tests)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
				outputMode = "remote",
			},
		},
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
		sh = {
			{
				type = "bashdb",
				request = "launch",
				name = "Launch file",
				showDebugOutput = true,
				pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
				pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
				trace = true,
				file = "${file}",
				program = "${file}",
				cwd = "${workspaceFolder}",
				pathCat = "cat",
				pathBash = "/bin/bash",
				pathMkfifo = "mkfifo",
				pathPkill = "pkill",
				args = {},
				env = {},
				terminalKind = "integrated",
			},
		},
	},
}
