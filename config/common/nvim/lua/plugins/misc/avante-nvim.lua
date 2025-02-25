return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
		behaviour = {
			auto_suggestions = true,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = false,
			minimize_diff = true,
			enable_token_counting = true,
			enable_cursor_planning_mode = true,
		},
		hints = { enabled = false },
		auto_suggest_provider = "claude",
		-- Provider settings
		provider = "claude",
		cursor_applying_provider = "groq",
		-- Providers
		claude = {
			endpoint = "https://api.anthropic.com",
			api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.anthropic",
			model = "claude-3-7-sonnet-20250219",
			temperature = 0,
			max_tokens = 16384,
		},
		openai = {
			api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.openai",
			endpoint = "https://api.openai.com/v1",
			model = "o3-mini",
			timeout = 30000,
			temperature = 0,
			max_tokens = 16384,
		},
		vendors = {
			--- ... existing vendors
			groq = {
				__inherited_from = "openai",
				api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.groq",
				endpoint = "https://api.groq.com/openai/v1/",
				model = "llama-3.3-70b-versatile",
				max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
			},
		},
		-- Daul Boost
		dual_boost = {
			enabled = false,
			first_provider = "openai",
			second_provider = "claude",
			prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
			timeout = 60000, -- Timeout in milliseconds
		},
		-- Tools
		web_search_engine = {
			providers = {
				tavily = {
					api_key_name = "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",
				},
			},
		},
		rag_service = {
			enabeld = true,
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
