return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = true,
	opts = {
		delay = 500,
		preset = "classic",
		-- Disabled by default for Telescope
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	},
}
