-- Set Leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Windows Management.
-- split window
vim.keymap.set("n", "sh", ":split<Return><C-w>w", { noremap = true }) -- horizontal
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { noremap = true }) -- vertical

-- move window
vim.keymap.set("", "s<left>", "<C-w>H", { noremap = true })
vim.keymap.set("", "s<down>", "<C-w>J", { noremap = true })
vim.keymap.set("", "s<up>", "<C-w>K", { noremap = true })
vim.keymap.set("", "s<right>", "<C-w>L", { noremap = true })
vim.keymap.set("", "sh", "<C-w>h", { noremap = true })
vim.keymap.set("", "sj", "<C-w>j", { noremap = true })
vim.keymap.set("", "sk", "<C-w>k", { noremap = true })
vim.keymap.set("", "sl", "<C-w>l", { noremap = true })

-- make adjusting split sizes a bit more friendly
vim.keymap.set("", "<C-Left>", ":vertical resize +3<CR>", { silent = true, noremap = true })
vim.keymap.set("", "<C-Right>", ":vertical resize -3<CR>", { silent = true, noremap = true })
vim.keymap.set("", "<C-Up>", ":resize +3<CR>", { silent = true, noremap = true })
vim.keymap.set("", "<C-Down>", ":resize -3<CR>", { silent = true, noremap = true })

-- Change mode using jk instead of esc.
vim.keymap.set("i", "jk", "<esc>", { noremap = true })

-- Mapping esc to backtick.
vim.keymap.set("i", "<esc>", "`", { noremap = true })

-- Ctrl+c yanks to system clipboard (and unhighlight text)
vim.keymap.set("v", "<C-c>", '"+y:nohl<CR>', { silent = true, noremap = true })

-- Remap swap capitalization to ±
vim.keymap.set("n", "±", "~")
vim.keymap.set("v", "±", "~")

-- Quickfix movement
vim.keymap.set("n", "<C-n>", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", ":cprevious<CR>", { silent = true })

-- Visual mode replacement for selected text
vim.keymap.set("v", "<leader>r", [["hy:%s/\V<C-r>h/<C-r>h/g<Left><Left>]], { noremap = true })

-- Open command mode with search and replace for highlighted text
vim.keymap.set("v", "<leader>s", [["hy:%s/<C-r>h/]], { noremap = true })

-- Format JSON: Replace \" with " and run jq on highlighted text
vim.keymap.set("v", "<leader>jq", [[:s/\\"/"/g<CR> | :'<,'>!jq .<CR>]], { noremap = true, silent = true })

-- Copy file path with @ prefix
vim.keymap.set("n", "<leader>yy", function()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        print("Error: not in a git repository")
        return
    end
    local path = "@" .. vim.fn.expand("%:p"):sub(#vim.trim(git_root) + 2)
    vim.fn.setreg("+", path)
    print("Copied: " .. path)
end, { silent = true })

-- Copy GitHub URL with line number (supports visual mode for ranges)
local function copy_github_url(is_visual)
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        print("Error: not in a git repository")
        return
    end

    local remote_url = vim.fn.systemlist("git remote get-url origin")[1]
    if vim.v.shell_error ~= 0 then
        print("Error: no origin remote found")
        return
    end

    -- Convert SSH to HTTPS format
    local github_url = remote_url
        :gsub("git@github.com:", "https://github.com/")
        :gsub("%.git$", "")

    local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
    local rel_path = vim.fn.expand("%:p"):sub(#vim.trim(git_root) + 2)

    local line_ref
    if is_visual then
        local start_line = vim.fn.line("'<")
        local end_line = vim.fn.line("'>")
        line_ref = "#L" .. start_line .. "-L" .. end_line
    else
        line_ref = "#L" .. vim.fn.line(".")
    end

    local url = github_url .. "/blob/" .. branch .. "/" .. rel_path .. line_ref
    vim.fn.setreg("+", url)
    print("Copied: " .. url)
end

vim.keymap.set("n", "<leader>yg", function() copy_github_url(false) end, { silent = true })
vim.keymap.set("v", "<leader>yg", function() copy_github_url(true) end, { silent = true })
