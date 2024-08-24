return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		keys = {
			{
				"<leader>hq",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon: toggle [Q]uick menu",
			},
			{
				"<leader>ha",
				function()
					require("harpoon.ui"):list():add()
				end,
				desc = "Harpoon: [A]dd file",
			},
			{
				"<leader>h1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon: File 1",
			},
			{
				"<leader>h2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon: File 2",
			},
			{
				"<leader>h3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon: File 3",
			},
			{
				"<leader>h4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon: File 4",
			},
			{
				"<leader>hf",
				function()
					local conf = require("telescope.config").values
					local harpoon_files = require("harpoon"):list()
					local file_paths = {}
					for _, item in ipairs(harpoon_files.items) do
						table.insert(file_paths, item.value)
					end

					require("telescope.pickers")
						.new({}, {
							prompt_title = "Harpoon",
							finder = require("telescope.finders").new_table({
								results = file_paths,
							}),
							previewer = conf.file_previewer({}),
							sorter = conf.generic_sorter({}),
						})
						:find()
				end,
				desc = "Harpoon: find file",
			},
			{
				"<leader>ho",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Harpoon: next file",
			},
			{
				"<leader>hi",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Harpoon: prev file",
			},
		},
	},
}
