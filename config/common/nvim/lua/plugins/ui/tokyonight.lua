return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			lualine_bold = true,

			on_highlights = function(highlights)
				highlights.LineNr = { fg = "#4C566A" }
				highlights.LspInlayHint = { bg = "none", fg = "#565f89" }
			end,
		})

		vim.cmd([[colorscheme tokyonight]])
		vim.cmd.colorscheme("tokyonight")
	end,
}
