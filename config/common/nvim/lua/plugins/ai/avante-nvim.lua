return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
		behaviour = {
			enable_claude_text_editor_tool_mode = true,
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
			minimize_diff = true,
			enable_token_counting = true,
			enable_cursor_planning_mode = false,
		},
		hints = { enabled = false },
		auto_suggest_provider = "claude",
		windows = {
			position = "right",
		},
		-- Provider settings
		provider = "claude",
		-- cursor_applying_provider = "groq",
		-- Providers
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.anthropic",
				model = "claude-3-7-sonnet-20250219",
				extra_request_body = {
					temperature = 0,
					max_tokens = 16384,
				},
				-- disabled_tools = { "python" },
			},
			openai = {
				api_key_name = "cmd:cat " .. os.getenv("HOME") .. "/.openai",
				endpoint = "https://api.openai.com/v1",
				model = "o3-mini-2025-01-31",
				timeout = 30000,
				extra_request_body = {
					temperature = 0,
					max_completion_tokens = 16384,
				},
				disable_tools = true,
			},
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
		mappings = {
			select_model = "<leader>am",
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
		-- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions (disabled - using blink.cmp instead)
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
