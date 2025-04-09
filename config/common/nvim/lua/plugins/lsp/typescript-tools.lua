return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		-- Import utilities from separate file
		-- local ts_utils = require("config.utils.ts-utils")

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

				-- Add custom function to convert parameters to object pattern
				-- vim.keymap.set(
				-- 	"n",
				-- 	"<leader>to",
				-- 	ts_utils.convert_to_object_params,
				-- 	{ buffer = bufnr, desc = "Convert parameters to object pattern" }
				-- )

				-- Add custom function to convert parameters to object pattern in visual mode
				-- vim.keymap.set(
				-- 	"v",
				-- 	"<leader>to",
				-- 	ts_utils.convert_visual_to_object_params,
				-- 	{ buffer = bufnr, desc = "Convert selected parameters to object pattern" }
				-- )
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
