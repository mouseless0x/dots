return {
	lua_ls = {
		Lua = {
			hint = { enable = true },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
	bashls = {
		filetypes = { "sh", "zsh" },
	},
	tsserver = {
		settings = {
			typescript = {
				inlayHints = {
					-- Enabled
					includeInlayParameterNameHints = "all",
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayEnumMemberValueHints = true,
					-- Disabled
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = false,
					includeInlayVariableTypeHints = false,
					includeInlayVariableTypeHintsWhenTypeMatchesName = false,
					includeInlayFunctionLikeReturnTypeHints = false,
				},
			},
		},
	},
	solidity_ls_nomicfoundation = {
		cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
		filetypes = { "solidity" },
		single_file_support = true,
	},
	tailwindcss = {},
	marksman = {
		filetypes = { "md", "mdx" },
	},
}
