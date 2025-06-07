return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		--cmdline = {
		--    enabled = false,
		--},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
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
		override = {
			-- override the default lsp markdown formatter with Noice
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- override the lsp markdown formatter with Noice
			["vim.lsp.util.stylize_markdown"] = true,
			-- override cmp documentation with Noice (needs the other options to work)
			["cmp.entry.get_documentation"] = true,
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
