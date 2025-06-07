return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		--cmdline = {
		--    enabled = false,
		--},
		notify = {
			enabled = false,
		},
		presets = {
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		views = {
			hover = {
				border = {
					style = "rounded",
				},
				win_options = {
					winhighlight = {
						Normal = "Normal",
						FloatBorder = "Normal",
					},
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}

