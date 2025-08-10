return {
	"saghen/blink.cmp",
	version = "*",
	opts = {
		signature = { enabled = true },
		keymap = {
			["<CR>"] = {
				function(cmp)
					return cmp.accept()
				end,
				"fallback",
			},
		},
	},
}
