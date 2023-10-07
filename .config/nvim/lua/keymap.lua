vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

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

-- prevent yanking on paste
vim.keymap.set("x", "p", "P", { noremap = true, silent = true })

-- insert mode mappings
vim.keymap.set("i", "<c-v>", "<esc>pa", { noremap = true, silent = true })
vim.keymap.set("i", "<c-bs>", "<c-w>", { noremap = true, silent = true })

-- cmdline completions wildmenu navigation
vim.cmd("cmap <expr> <c-j> \"<c-n>\"")
vim.cmd("cmap <expr> <c-k> \"<c-p>\"")
vim.cmd("cmap <expr> <c-l> \"<cr>\"")

-- nvim-comment
vim.keymap.set("n", "<leader>c", "<cmd>CommentToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("x", "<leader>c", "<cmd>'<,'>CommentToggle<cr>", { noremap = true, silent = true })

-- telescope
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

-- nvim-tree
vim.keymap.set("n", "<c-b>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

-- don't enter tree buffer on open
vim.keymap.set("n", "<c-b>", "<cmd>lua require('nvim-tree.api').tree.toggle(false, true)<cr>", { noremap = true, silent = true })

-- lsp
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", { noremap = true, silent = true })
