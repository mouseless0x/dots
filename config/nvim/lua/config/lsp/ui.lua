M = {}
M.setup = function()
	-- Disable annoying code action lightbulb
	vim.lsp.handlers["textDocument/codeAction"] = vim.lsp.with(vim.lsp.handlers.codeAction, {
		lightbulb = false,
	})

	-- Pretty floaters for all lsp related popups
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		close_events = { "BufHidden", "InsertLeave" },
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.diagnostic.config({
		float = {
			border = "rounded",
		},
	})
end

return M
