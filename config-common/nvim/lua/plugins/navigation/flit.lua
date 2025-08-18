return {
    {
        "ggandor/flit.nvim",
        dependencies = { "ggandor/leap.nvim" },
        config = function()
            require("flit").setup({
                keys = { f = "f", F = "F", t = "t", T = "T" },
                labeled_modes = "nx",
                multiline = true,
                opts = {},
            })
        end,
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").create_default_mappings()
        end,
    },
}