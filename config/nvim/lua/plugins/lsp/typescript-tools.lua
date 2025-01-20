return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			on_attach = function(client, bufnr)
				-- this is important, otherwise tsserver will format ts/js
				-- files which we *really* don't want.
				client.server_capabilities.documentFormattingProvider = false

				-- remappings
				vim.keymap.set(
					"n",
					"<leader>tc",
					"<cmd>TSToolsRemoveUnusedImports<cr>",
					{ buffer = bufnr, desc = "Remove unused imports" }
				)
			end,
			settings = {
				tsserver_file_preferences = {
					-- includeInlayParameterNameHints = "all",
					-- includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					-- includeInlayFunctionParameterTypeHints = true,
					-- includeInlayVariableTypeHints = true,
					-- includeInlayPropertyDeclarationTypeHints = true,
					-- includeInlayFunctionLikeReturnTypeHints = true,
					-- includeInlayEnumMemberValueHints = true,
				},
			},
		})
	end,
}
