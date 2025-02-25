return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			lualine_bold = true,

			on_highlights = function(highlights)
				highlights.LineNr = { fg = "#4C566A" }
			end,
		})

		vim.cmd([[colorscheme tokyonight]])
		vim.cmd.colorscheme("tokyonight")
	end,
}
