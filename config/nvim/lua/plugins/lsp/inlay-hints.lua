return {
	"felpafel/inlay-hint.nvim",
	event = "LspAttach",
	config = function()
		require("inlay-hint").setup({
			virt_text_pos = "eol",
			highlight_group = "LspInfoTip",
			hl_mode = "combine",
		})
	end,
}