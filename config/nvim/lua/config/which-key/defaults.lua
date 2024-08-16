return {
	h = {
		name = "+Harpoon",
		m = {
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			"Harpoon Menu",
		},
		a = {
			function()
				require("harpoon"):list():apned()
			end,
			"Harpoon File",
		},
		["1"] = {
			function()
				require("harpoon"):list():select(1)
			end,
			"Harpoon File #1",
		},
		["2"] = {
			function()
				require("harpoon"):list():select(2)
			end,
			"Harpoon File #2",
		},
		["3"] = {
			function()
				require("harpoon"):list():select(3)
			end,
			"Harpoon File #3",
		},
		["4"] = {
			function()
				require("harpoon"):list():select(4)
			end,
			"Harpoon File #4",
		},
		f = {
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
			"Find Harpoon File",
		},
	},
}
