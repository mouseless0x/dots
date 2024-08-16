return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "\\", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            reveal_force_cwd = true,
            window = {
                position = "right"
            }
        })
    end,
}
