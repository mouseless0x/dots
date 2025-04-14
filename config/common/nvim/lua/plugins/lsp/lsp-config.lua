return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"folke/neodev.nvim",
		},
		--opts = {
		--	inlay_hints = { enable = false },
		--},
		config = function()
			-- needs to be called before lua_ls is setup
			require("neodev").setup()

			-- setup ui
			require("config.lsp.ui").setup()

			-- Create an autocmd to apply on_attach when an LSP client attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local on_attach_module = require("config.lsp.on_attach")
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local bufnr = args.buf
					on_attach_module.on_attach(client, bufnr)
				end,
			})

			-- enable servers
			vim.lsp.enable({
				"lua_ls",
				"bashls",
				"solidity_ls_nomicfoundation",
				"marksman",
			})
		end,
	},
}
