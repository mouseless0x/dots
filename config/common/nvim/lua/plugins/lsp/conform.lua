return {
	"stevearc/conform.nvim",
	config = function()
		-- Setup conform
		require("conform").setup({
			formatters_by_ft = {
				sol = { "forge_fmt" },
				solidity = { "forge_fmt" },
				lua = { "stylua" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				javascript = { "biome" },
				javascriptreact = { "biome" },
				tsx = { "biome" },
				jsx = { "biome" },
			},
		})

		-- Autoformat on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
