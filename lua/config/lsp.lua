-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.code_action, { desc = "Gerar implementação de interface" })
		--returar a linha abaixo e colocar no init
		vim.keymap.set("n", "<leader>o", function()
			vim.diagnostic.open_float(nil, { border = "rounded" })
		end, { noremap = true, silent = true })
	end,
})

-- Limita linhas vazias consecutivas em arquivos Odin
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.odin",
	callback = function()
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		local new_lines = {}
		local blank_count = 0

		for _, line in ipairs(lines) do
			if line:match("^%s*$") then
				blank_count = blank_count + 1
				if blank_count <= 1 then
					table.insert(new_lines, line)
				end
			else
				blank_count = 0
				table.insert(new_lines, line)
			end
		end

		vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
	end,
})

local configs = require("config.lspconfig")
for key, value in pairs(configs) do
	vim.lsp.config(key, value)
	vim.lsp.enable(key)
end
