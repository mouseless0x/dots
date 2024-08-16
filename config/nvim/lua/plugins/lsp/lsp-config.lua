return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(require("config.lsp.servers")),
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            inlay_hints = { enable = true },
        },
        dependencies = {
            "folke/neodev.nvim"
        },
        config = function()
            -- needs to be called before lua_ls is setup
            require("neodev").setup()

            -- Pretty floaters for all lsp related popups
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            	border = "rounded",
            	close_events = { "BufHidden", "InsertLeave" },
            })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            	border = "rounded",
            })

            vim.diagnostic.config({
            	float = {
            		border = "rounded",
            	},
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = require("config.lsp.on_attach").on_attach,
                        on_init = require("config.lsp.on_init").on_init,
                        settings = require("config.lsp.servers")[server_name],
                        filetypes = (require("config.lsp.servers")[server_name] or {}).filetypes,
                    })
                end,
            })
        end
    },
}
