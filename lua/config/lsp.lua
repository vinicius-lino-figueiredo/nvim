-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover { border = "single" } end , opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.code_action, { desc = 'Gerar implementação de interface' })
    --returar a linha abaixo e colocar no init
    vim.keymap.set('n', '<leader>o', function() vim.diagnostic.open_float(nil, { border = "rounded" }) end, { noremap = true, silent = true })
  end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'sh',
--   callback = function()
--     vim.lsp.start({
--       name = 'bash-language-server',
--       cmd = { 'bash-language-server', 'start' },
--     })
--   end,
-- })

require('lspconfig').gopls.setup({})
require("lspconfig").ts_ls.setup({
	on_attach = function(_, bufnr)
		vim.api.nvim_set_option_value("tabstop", 2, { buf = bufnr })
		vim.api.nvim_set_option_value("shiftwidth", 2, { buf = bufnr })
		vim.api.nvim_set_option_value("softtabstop", 2, { buf = bufnr })
		vim.api.nvim_set_option_value("expandtab", true, { buf = bufnr })
	end,
})

local lspconfig = require("lspconfig")
local configs = require("config.lspconfig")
for key, value in pairs(configs) do
	lspconfig[key].setup(value)
end
