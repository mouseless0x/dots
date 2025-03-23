return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- Set keymaps for lazygit
        vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true, desc = "Open LazyGit" })
        
        -- Configure lazygit floating window if desired
        vim.g.lazygit_floating_window_winblend = 0  -- transparency of floating window
        vim.g.lazygit_floating_window_scaling_factor = 0.9  -- scaling factor for floating window
        vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'}  -- customize corner characters of floating window
        vim.g.lazygit_floating_window_use_plenary = 0  -- use plenary.nvim to manage floating window if available
        vim.g.lazygit_use_neovim_remote = 1  -- fallback to 0 if neovim-remote is not installed
        
        -- Close Neovim when exiting lazygit
        vim.g.lazygit_use_custom_config_file_path = 0  -- use custom config
        vim.g.lazygit_config_file_path = ''  -- custom config file path
    end
}