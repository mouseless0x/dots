return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = "",
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	keys = {
		{ -- only using saga for this one command, cmon man just move it out
			",sr",
			"<Cmd>Lspsaga rename ++project<CR>",
			"n",
			desc = "[R]ename in whole project",
		},
	},
}
