vim.api.nvim_set_keymap('n', '<leader>fp', ':Conform<CR>', { noremap = true, silent = true })
-- require("conform").setup({
--   formatters_by_ft = {
--     sql = { "sql-formatter" },
--   },
-- })
require('conform').setup({
  formatters_by_ft = {
    sql = { "prettier" },  -- Defina o sql-formatter para SQL
  },
  format_on_save = true,  -- Opção para formatar automaticamente ao salvar
})
