return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false, -- This plugin is already lazy
	init = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
				on_attach = require("config.lsp.on_attach").on_attach,
				on_init = require("config.lsp.on_init").on_init,
				capabilities = require("config.lsp.capabilities").capabilities,
			},
		}
	end,
}
