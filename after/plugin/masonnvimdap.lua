require("mason-nvim-dap").setup({
	automatic_installation = false,
	handlers = {
		delve = function(config)
			config.adapters = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}
			config.configurations = {
				{
					type = "delve",
					name = "Debug Package",
					request = "launch",
					program = "./${relativeFileDirname}",
					outputMode = "remote",
				},
				{
					type = "delve",
					name = "Debug Package (tests)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
					outputMode = "remote",
				},
				{
					type = "delve",
					name = "Debug Package with Args",
					request = "launch",
					program = "./${relativeFileDirname}",
					outputMode = "remote",
					args = function()
						local args_string = vim.fn.input("Args: ")
						return vim.split(args_string, " +")
					end,
				},
				{
					type = "delve",
					name = "Debug Package (tests) with Args",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
					outputMode = "remote",
					args = function()
						local args_string = vim.fn.input("Test flags (e.g., -test.bench . -test.run TestName): ")
						if args_string == "" then
							return {}
						end
						local args = {}
						for arg in args_string:gmatch("%S+") do
							table.insert(args, arg)
						end
						return args
					end,
				},
			}
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})
