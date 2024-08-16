return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 6900,
    config = function()
        require("tokyonight").setup({
	        lualine_bold = true,

	        --- You can override specific highlights to use other groups or a hex color
	        --- function will be called with a Highlights and ColorScheme table
	        ---@param highlights Highlights
	        ---@param colors ColorScheme
	        on_highlights = function(highlights, colors)
	        	highlights.LineNr = { fg = "#4C566A" }
	        end,
        })

        vim.cmd([[colorscheme tokyonight]])
        vim.cmd.colorscheme("tokyonight")
    end
}
