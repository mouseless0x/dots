return {
	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("claude-code").setup({
				window = {
					height_ratio = 0.6, -- Percentage of screen height for the terminal window
					position = "botright", -- Position of the window: "botright", "topleft", etc.
					enter_insert = true, -- Whether to enter insert mode when opening Claude Code
				},
				keymaps = {
					toggle = {
						normal = "<leader>cc", -- Normal mode keymap for toggling Claude Code
						terminal = "<leader>cc", -- Terminal mode keymap for toggling Claude Code
					},
				},
			})
			-- Add additional keymaps
			vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
		end,
	},
}
