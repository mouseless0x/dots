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

-- Format JSON: Replace \" with " and run jq on highlighted text
vim.keymap.set("v", "<leader>jq", [[:s/\\"/"/g<CR> | :'<,'>!jq .<CR>]], { noremap = true, silent = true })
