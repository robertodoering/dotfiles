------------
-- keymap --
------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local nmap = function(key, args, silent)
  silent = silent or true
  vim.keymap.set("n", key, args, { noremap = true, silent = silent })
end

local imap = function(key, args)
  vim.keymap.set("i", key, args, { noremap = true, silent = true })
end

local xmap = function(key, args)
  vim.keymap.set("x", key, args, { noremap = true, silent = true })
end

local cmap = function(key, args)
  vim.keymap.set("c", key, args, { noremap = true, silent = true })
end

local tmap = function(key, args)
  vim.keymap.set("t", key, args, { noremap = true, silent = true })
end

nmap("<c-s>", "<cmd>w<cr>", false)

-- move around buffers
nmap("<c-h>", "<c-w>h")
nmap("<c-j>", "<c-w>j")
nmap("<c-k>", "<c-w>k")
nmap("<c-l>", "<c-w>l")

-- resize buffers
-- nmap("<c-s-H>", "<cmd>vertical resize +2<cr>")
-- nmap("<c-s-J>", "<cmd>resize -2<cr>")
-- nmap("<c-s-K>", "<cmd>resize +2<cr>")
-- nmap("<c-s-L>", "<cmd>vertical resize -2<cr>")

-- move out of terminal
tmap("<c-h>", "<c-\\><c-n><c-w>h")
tmap("<c-j>", "<c-\\><c-n><c-w>j")
tmap("<c-k>", "<c-\\><c-n><c-w>k")
tmap("<c-l>", "<c-\\><c-n><c-w>l")

-- center on c-d/u
nmap("<c-d>", "20jzz")
nmap("<c-u>", "20kzz")
xmap("<c-d>", "20jzz")
xmap("<c-u>", "20kzz")

-- insert mode mappings
imap("<c-v>", "<esc>pa")
imap("<c-bs>", "<c-w>")

-- cmdline completions wildmenu navigation
vim.cmd("cmap <expr> <c-j> \"<c-n>\"")
vim.cmd("cmap <expr> <c-k> \"<c-p>\"")
vim.cmd("cmap <expr> <c-l> \"<cr>\"")

-- nvim-comment
nmap("<leader>c", "<cmd>CommentToggle<cr>")
xmap("<leader>c", ":'<,'>CommentToggle<cr>")

-- telescope
nmap("<leader><leader>", "<cmd>Telescope find_files<cr>")

-- nvim-tree
nmap("<c-b>", "<cmd>NvimTreeToggle<cr>")
-- nmap("<c-b>", "<cmd>lua require('nvim-tree.api').tree.toggle(false, true)<cr>") -- don't enter tree buffer on open

-- lsp
nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
nmap("<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>")
nmap("<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
nmap("<leader>dd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
nmap("<leader>dk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>")
nmap("<leader>dj", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>")
nmap("<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")
nmap("<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>")
