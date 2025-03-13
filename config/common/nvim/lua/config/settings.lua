vim.opt.guicursor = "n:block-blinkon500,i:hor20"

-- Show line num (+ relative line num).
vim.opt.number = true
vim.opt.relativenumber = true

-- Add filetype
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

-- Show filename.
vim.opt.title = true

-- Default format.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

-- Turn on true color support in the terminal.
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Append "@" and "-" to the set of characters that are considered part of a file name
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Temp
-- vim.opt.timeout = true
-- vim.opt.timeoutlen = 1000
-- vim.opt.ttimeout = true
-- vim.opt.ttimeoutlen = 10

vim.opt.foldcolumn = "1"

-- Tabs and spacing for specific filetypes.
vim.api.nvim_command("autocmd BufNewFile,BufRead *.sql setlocal tabstop=2 shiftwidth=2 expandtab")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.tsx setlocal tabstop=2 shiftwidth=2 expandtab")
-- vim.api.nvim_command("autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 shiftwidth=2 expandtab")

-- Highlight text when it is yanked.
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Trim white spaces before saving.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = config,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
