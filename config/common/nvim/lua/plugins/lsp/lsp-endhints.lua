return {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
    config = function()
        require("lsp-endhints").setup({
            icons = {
                type = "=> ",
                parameter = "< ",
                offspec = " ", -- hint kind not defined in the spec
                unknown = " ", -- hint kind is nil
            },
            label = {
                padding = 1,
                marginLeft = 0,
                bracketedParameters = true, -- show parameters with brackets like <name>
            },
            autoEnableHints = "rust-analyzer", -- only enable for rust-analyzer
        })
    end,
}