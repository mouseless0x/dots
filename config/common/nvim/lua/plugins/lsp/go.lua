return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup({
			lsp_cfg = false,
			-- other setups...
			lsp_inlay_hints = {
				enable = false,
				style = "eol",
			},
		})
		local cfg = require("go.lsp").config() -- config() return the go.nvim gopls setup
		cfg.on_attach = require("config.lsp.on_attach").on_attach

		require("lspconfig").gopls.setup(cfg)

		-- Run gofmt + goimports on save
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").gofmt()
			end,
			group = format_sync_grp,
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
