M = {}
M.setup = function()
	-- Neovim 0.11+ global option for all floating window borders
	-- Sets consistent border style across all floating windows
	vim.opt.winborder = "rounded"

	-- Diagnostic config with improved UI
	vim.diagnostic.config({
		float = {
			border = "rounded",
		},
		-- Highlight referenced text in hover (new in 0.11)
		hover = {
			show_header = true,
		},
	})

	-- Set highlight for hover references (new in 0.11)
	vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#3b404a" })
	vim.api.nvim_set_hl(0, "LspReferenceTarget", { bg = "#3b404a" })
end

return M
