return {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					special = { reload = "require" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					},
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
