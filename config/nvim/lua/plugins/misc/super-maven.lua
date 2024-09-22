return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				-- accept_suggestion = "<CR>",
				-- clear_suggestion = "<C-]>",
				-- accept_word = "<C-j>",
			},
			--disable_inline_completion = true,
			-- disable_keymaps = true,
		})

		--vim.keymap.del("i", "<Tab>", { noremap = true, silent = true })
	end,
}
