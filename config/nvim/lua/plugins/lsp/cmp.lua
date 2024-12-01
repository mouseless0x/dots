return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",

		-- Adds vscode-like pictograms
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		local function border(hl_name)
			return {
				{ "╭", hl_name },
				{ "─", hl_name },
				{ "╮", hl_name },
				{ "│", hl_name },
				{ "╯", hl_name },
				{ "─", hl_name },
				{ "╰", hl_name },
				{ "│", hl_name },
			}
		end

		cmp.setup({
			enabled = true,
			completion = {
				completeopt = "menu,menuone",
				-- autocomplete = false,
			},
			window = {
				completion = {
					border = border("CmpBorder"),
					side_padding = 1,
				},
				documentation = {
					border = border("CmpDocBorder"),
				},
			},
			-- snippet = {
			-- 	expand = function(args)
			-- 		require("luasnip").lsp_expand(args.body)
			-- 		vim.snippet.expand(args.body)
			-- 	end,
			-- },

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true,

					before = function(entry, vim_item)
						vim_item.menu = ({
							luasnip = "[luasnip]",
							nvim_lsp = "[lsp]",
							path = "[path]",
							buffer = "[buffer]",
							look = "[dict]",
						})[entry.source.name]

						return vim_item
					end,
				}),
			},

			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.complete(),

				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),

				["<Leader><Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),

				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item()
				-- 	--elseif require("luasnip").jumpable(-1) then
				-- 	--	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
		})

		vim.keymap.set("n", "<leader>ct", function()
			if vim.b.cmp_enabled == true then
				require("cmp").setup.buffer({ enabled = false })
				vim.b.cmp_enabled = false
				vim.notify("nvim-cmp disabled", vim.log.levels.INFO)
			else
				require("cmp").setup.buffer({ enabled = true })
				vim.b.cmp_enabled = true
				vim.notify("nvim-cmp enabled", vim.log.levels.INFO)
			end
		end, { noremap = true, silent = true })

		-- Disable cmp at startup
		require("cmp").setup.buffer({ enabled = false })

		-- sus
		-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
