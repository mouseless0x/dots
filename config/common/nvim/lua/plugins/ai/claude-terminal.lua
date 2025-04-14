return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 20,
            hide_numbers = true,
            shade_terminals = true,
            direction = "float",
            float_opts = {
                border = "curved"
            },
            close_on_exit = true
        })
        
        -- Create a dedicated terminal for Claude
        local Terminal = require("toggleterm.terminal").Terminal
        local claude_term = Terminal:new({
            cmd = "claude",
            dir = vim.fn.getcwd(),
            direction = "float",
            count = 1,
        })
        
        -- Function to toggle Claude terminal
        function _toggle_claude_terminal()
            claude_term:toggle()
        end
        
        -- Map <leader>cc to toggle Claude terminal
        vim.keymap.set("n", "<leader>cc", _toggle_claude_terminal, { silent = true, desc = "Toggle Claude Code terminal" })
        
        -- Set up a keymap to easily exit terminal mode
        vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
    end
}