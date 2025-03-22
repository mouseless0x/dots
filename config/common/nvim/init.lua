-- require("config.keymaps")
-- require("config.autocmds")
-- require("config.abbreviations")
require("config.settings")
require("config.remap")
-- Setup diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
    },
})
vim.diagnostic.enable()
require("config.lazy")
