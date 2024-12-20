return {
	lua_ls = {
		Lua = {
			hint = { enable = false },
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
	solidity_ls_nomicfoundation = {
		cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
		filetypes = { "solidity" },
		single_file_support = true,
	},
	tailwindcss = {},
	basedpyright = {},
	marksman = {
		filetypes = { "md", "mdx" },
	},
}
