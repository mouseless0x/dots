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
        	completion = {
        		completeopt = "menu,menuone",
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
        	snippet = {
        		expand = function(args)
        			require("luasnip").lsp_expand(args.body)
        		end,
        	},

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
        		["<C-Space>"] = cmp.mapping.complete(),
        		["<C-e>"] = cmp.mapping.close(),

        		["<CR>"] = cmp.mapping.confirm({
        			behavior = cmp.ConfirmBehavior.Insert,
        			select = true,
        		}),

        		["<Tab>"] = cmp.mapping(function(fallback)
        			if cmp.visible() then
        				cmp.select_next_item()
        			elseif require("luasnip").expand_or_jumpable() then
        				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        			else
        				fallback()
        			end
        		end, { "i", "s" }),

        		["<S-Tab>"] = cmp.mapping(function(fallback)
        			if cmp.visible() then
        				cmp.select_prev_item()
        			elseif require("luasnip").jumpable(-1) then
        				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        			else
        				fallback()
        			end
        		end, { "i", "s" }),
        	},
        	sources = {
        		{ name = "nvim_lsp" },
        		{ name = "luasnip" },
        		{ name = "buffer" },
        		{ name = "nvim_lua" },
        		{ name = "path" },
        	},
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
