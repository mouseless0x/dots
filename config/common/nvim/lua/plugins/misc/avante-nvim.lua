return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
		hints = { enabled = true },
		provider = "claude",
		claude = {
			api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.anthropic",
		},
		windows = {
			position = "right",
			wrap = true,
			width = 40,
			sidebar_header = {
				enabled = false,
				align = "right",
				rounded = false,
			},
		},
	},
	build = ":AvanteBuild source=false",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
