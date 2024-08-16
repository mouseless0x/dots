return {
    lua_ls = {
        Lua = {
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
    tsserver = {},
    solidity_ls_nomicfoundation = {},
}
