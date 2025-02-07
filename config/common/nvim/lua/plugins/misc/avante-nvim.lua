return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
		hints = { enabled = true },
		provider = "claude",
		claude = {
			api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.anthropic",
		},
		--openai = {
		--	api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.openai",
		--	endpoint = "https://api.openai.com/v1",
		--	model = "o3-mini", -- your desired model (or use gpt-4o, etc.)
		--	timeout = 30000, -- timeout in milliseconds
		--	temperature = 0, -- adjust if needed
		--	max_tokens = 4096,
		--},
		web_search_engine = {
			providers = {
				tavily = {
					api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.tavily",
				},
			},
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	config = function(_, opts)
		require("avante").setup(opts)
		vim.opt.laststatus = 3
	end,
}
