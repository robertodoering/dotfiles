vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.mouse = "a" -- enable mouse
vim.opt.signcolumn = "yes" -- always show signcolumn
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.splitright = true -- open new vsplits to the right
vim.opt.splitbelow = true -- open new splits below
vim.opt.laststatus = 3 -- show the status line only on the last window
vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.updatetime = 200
vim.opt.iskeyword:append("-") -- treat dash separated words as a single word
vim.opt.showmode = false -- hide mode text
vim.opt.hidden = false -- unload hidden buffers
vim.opt.autochdir = true

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- case sensitive searching with capital letters

-- indentation
vim.opt.smartindent = true
vim.opt.expandtab = true -- insert spaces when pressing tab
vim.opt.tabstop = 2 -- use 2 spaces per tab
vim.opt.shiftwidth = 2 -- use 2 spaces for indentation
