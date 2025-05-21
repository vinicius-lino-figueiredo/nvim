local toggleterm = require("toggleterm")

local open_mapping = [[<C-]>]]
if vim.loop.os_uname().sysname == "Windows_NT" then
	open_mapping = [[<C-\>]]
end

toggleterm.setup({
	open_mapping = open_mapping,
	direction = "float",
	shade_terminals = true,
})
