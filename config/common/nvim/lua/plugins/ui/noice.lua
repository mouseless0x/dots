return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
			signature = { enabled = false }, -- disable noice.nvim signature as we are using blink.nvim
		},
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
