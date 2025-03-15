return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local mason_null_ls = require("mason-null-ls")
			local null_ls = require("null-ls")

			local null_ls_utils = require("null-ls.utils")

			mason_null_ls.setup({
				ensure_installed = {
					"stylua", -- lua formatter
					"buf", -- buf formatter
					"spell", -- spell checker
				},
			})

			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

				sources = {
					formatting.biome,
					formatting.forge_fmt,
					formatting.stylua,
					formatting.rustfmt,
				},

				-- configure format on save
				on_attach = function(client, bufnr)
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							-- vim.lsp.buf.formatting_sync({ async = false })
                vim.lsp.buf.format({ async = false })
						end,
					})
				end,
			})
		end,
	},
}
