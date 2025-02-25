M = {}
M.on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local function filtered_code_action()
		vim.lsp.buf.code_action({
			filter = function(action)
				local title = action.title

				return title ~= "Move to a new file"
					and title ~= "Move to file"
					and title ~= "Infer function return type"
			end,
			apply = true, -- Automatically apply the action if there's only one
		})
	end

	vim.keymap.set("i", "gp", function()
		vim.lsp.buf.signature_help()
	end, { buffer = true })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers["signature_help"], {
		border = "single",
		close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
	})

	nmap("]d", vim.diagnostic.goto_next, "prev [D]diagnostic")
	nmap("[d", vim.diagnostic.goto_prev, "next [D]diagnostic")
	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("go", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

	nmap("gk", vim.diagnostic.open_float, "Open Diagnostic Float")
	nmap("gl", filtered_code_action, "Open Filtered Code Action")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")

	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		-- Toggle inlay hints
		nmap("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "[T]oggle Inlay [H]ints")

		-- Enable inlay hints by default
		vim.lsp.inlay_hint.enable()
	end
end

return M
