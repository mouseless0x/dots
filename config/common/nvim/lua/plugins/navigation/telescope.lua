return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	keys = {
		{
			";;",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "Telescope: resume previous search",
		},
		{
			";r",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Telescope: Search live grep",
		},
		{
			";f",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope: Search files",
		},
		{
			";b",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope: Buffers",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						previewer = false,
						initial_mode = "normal",
						layout_config = {
							horizontal = {
								width = 0.5,
								height = 0.4,
								preview_width = 0.6,
							},
						},
					}),
				},
			},
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		-- Can be removed once borders are added to telescope (patch needed for nvim 0.11)
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopeFindPre",
			callback = function()
				vim.opt_local.winborder = "none"
				vim.api.nvim_create_autocmd("WinLeave", {
					once = true,
					callback = function()
						vim.opt_local.winborder = "rounded"
					end,
				})
			end,
		})
	end,
}

