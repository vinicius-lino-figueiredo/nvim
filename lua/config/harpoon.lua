require("telescope").load_extension('harpoon')
-- Importando o Harpoon e o Telescope
local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
-- local telescope = require('telescope.builtin')

-- Atalhos de teclado para o Harpoon com Telescope
vim.keymap.set('n', '<leader>hh', ":Telescope harpoon marks<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', function() harpoon_mark.add_file() end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-n>', function() harpoon_ui.nav_next() end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-p>', function() harpoon_ui.nav_prev() end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', function() harpoon_ui.toggle_quick_menu() end, { noremap = true, silent = true })
--
-- -- Navegação entre arquivos do Harpoon com Telescope
-- vim.keymap.set('n', '<A-1>', function() telescope.find_files({ cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h') }) end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-2>', function() telescope.find_files({ cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h') }) end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-3>', function() telescope.find_files({ cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h') }) end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-4>', function() telescope.find_files({ cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h') }) end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-5>', function() telescope.find_files({ cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h') }) end, { noremap = true, silent = true })
--
-- -- Comando do Telescope para acessar a lista de arquivos do Harpoon
-- vim.keymap.set('n', '<leader>hh', function() telescope.extensions.harpoon.marks() end, { noremap = true, silent = tr
