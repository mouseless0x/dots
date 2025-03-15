return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(require("config.lsp.servers")),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"folke/neodev.nvim",
		},
		opts = {
			inlay_hints = { enable = false },
		},
		config = function()
			-- needs to be called before lua_ls is setup
			require("neodev").setup()

			-- setup ui
			require("config.lsp.ui").setup()

			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("config.lsp.capabilities").capabilities,
						on_attach = require("config.lsp.on_attach").on_attach,
						on_init = require("config.lsp.on_init").on_init,
						settings = require("config.lsp.servers")[server_name],
						filetypes = (require("config.lsp.servers")[server_name] or {}).filetypes,
					})
				end,
			})
		end,
	},
}
