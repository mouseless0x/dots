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
			bottom_search = true,
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		cmdline = {
			enabled = true,
			view = "cmdline",
		},
		views = {
			signature = {
				scrollbar = true,
				size = { width = "auto", height = "auto" },
			},
			hover = {
				scrollbar = false,
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
