return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                else -- floating
                    return 20
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = false, -- Important: don't close on exit
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
                width = function()
                    return math.floor(vim.o.columns * 0.85)
                end,
                height = function()
                    return math.floor(vim.o.lines * 0.8)
                end
            },
        })

        -- Setup a terminal specifically for Claude Code
        local Terminal = require("toggleterm.terminal").Terminal
        local claude_code = Terminal:new({
            cmd = "claude-code",
            hidden = true,
            direction = "float",
            close_on_exit = false, -- Keep terminal open after exiting
            float_opts = {
                border = "curved",
            },
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
                -- Add additional terminal setup if needed
            end,
            on_exit = function(term, job, exit_code, name)
                -- Optionally restart the process if it exits
                if exit_code == 0 or exit_code == 130 then
                    -- Don't auto-restart on normal exit or SIGINT
                else
                    vim.fn.timer_start(1000, function()
                        term:spawn()
                    end)
                end
            end,
        })

        function _G.claude_code_toggle()
            claude_code:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>lua claude_code_toggle()<CR>", {noremap = true, silent = true, desc = "Toggle Claude Code Terminal"})
    end
}