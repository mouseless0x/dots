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
