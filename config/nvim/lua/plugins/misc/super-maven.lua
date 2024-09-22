return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})

		vim.keymap.set("n", "<leader>st", function()
			local api = require("supermaven-nvim.api")
			api.toggle()

			if api.is_running() then
				vim.notify("supermaven enabled", vim.log.levels.INFO)
			else
				vim.notify("supermaven disabled", vim.log.levels.INFO)
			end
		end, { noremap = true, silent = true })
	end,
}
