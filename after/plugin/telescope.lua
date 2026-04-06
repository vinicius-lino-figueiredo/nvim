-- Fix: set_preview_message crashes when winid is nil (self.state.winid not set on first preview)
-- Fallback: look up the current preview window from telescope's global state
local preview_utils = require("telescope.previewers.utils")
local telescope_state = require("telescope.state")
local orig_set_preview_message = preview_utils.set_preview_message
preview_utils.set_preview_message = function(bufnr, winid, message, fillchar)
	if type(winid) ~= "number" or not vim.api.nvim_win_is_valid(winid) then
		for _, prompt_bufnr in ipairs(telescope_state.get_existing_prompt_bufnrs()) do
			local status = telescope_state.get_status(prompt_bufnr)
			if status and status.layout and status.layout.preview then
				local candidate = status.layout.preview.winid
				if type(candidate) == "number" and vim.api.nvim_win_is_valid(candidate) then
					winid = candidate
					break
				end
			end
		end
	end
	if type(winid) ~= "number" or not vim.api.nvim_win_is_valid(winid) then
		return
	end
	orig_set_preview_message(bufnr, winid, message, fillchar)
end

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope Document Symbols" })
vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
vim.keymap.set("n", "<leader>fe", function()
	require("telescope.builtin").diagnostics()
end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { noremap = true, silent = true })
