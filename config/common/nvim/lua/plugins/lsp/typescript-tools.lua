return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		-- Import utilities from separate file

		require("typescript-tools").setup({
			on_attach = function(client, bufnr)
				-- this is important, otherwise tsserver will format ts/js
				-- files which we *really* don't want.
				client.server_capabilities.documentFormattingProvider = false

				-- Call the default on_attach function
				require("config.lsp.on_attach").on_attach(client, bufnr)

				-- typescript-specific remappings
				vim.keymap.set(
					"n",
					"<leader>tc",
					"<cmd>TSToolsRemoveUnusedImports<cr>",
					{ buffer = bufnr, desc = "Remove unused imports" }
				)
				vim.keymap.set(
					"n",
					"<leader>ti",
					"<cmd>TSToolsAddMissingImports<cr>",
					{ buffer = bufnr, desc = "Add missing imports" }
				)
			end,
		})
	end,
}
