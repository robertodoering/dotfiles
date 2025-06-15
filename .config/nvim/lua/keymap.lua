vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move around buffers
vim.keymap.set("n", "<c-h>", "<c-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<c-j>", "<c-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<c-k>", "<c-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<c-l>", "<c-w>l", { noremap = true, silent = true })

-- resize buffers
vim.keymap.set("n", "<c-s-H>", "<cmd>vertical resize +2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-s-J>", "<cmd>resize -2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-s-K>", "<cmd>resize +2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-s-L>", "<cmd>vertical resize -2<cr>", { noremap = true, silent = true })

-- center on c-d/u
vim.keymap.set("n", "<c-d>", "20jzz", { noremap = true, silent = true })
vim.keymap.set("n", "<c-u>", "20kzz", { noremap = true, silent = true })
vim.keymap.set("x", "<c-d>", "20jzz", { noremap = true, silent = true })
vim.keymap.set("x", "<c-u>", "20kzz", { noremap = true, silent = true })

-- insert mode mappings
vim.keymap.set("i", "<c-v>", "<esc>pa", { noremap = true, silent = true })
vim.keymap.set("i", "<c-bs>", "<c-w>", { noremap = true, silent = true })

-- cmdline completions wildmenu navigation
vim.cmd("cmap <expr> <c-j> \"<c-n>\"")
vim.cmd("cmap <expr> <c-k> \"<c-p>\"")
vim.cmd("cmap <expr> <c-l> \"<cr>\"")
