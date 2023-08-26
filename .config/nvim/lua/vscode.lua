-- options

local opt = vim.opt
local g = vim.g

opt.clipboard = "unnamedplus" -- use system clipboard
opt.swapfile = false
opt.updatetime = 200
opt.iskeyword:append("-") -- treat dash separated words as a single word
opt.hidden = false -- unload hidden buffers

-- search
opt.hlsearch = false
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case sensitive searching with capital letters


-- keymap

local set = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- center on c-d/u
set("n", "<c-d>", "20jzz", { noremap = true, silent = true })
set("n", "<c-u>", "20kzz", { noremap = true, silent = true })
set("x", "<c-d>", "20jzz", { noremap = true, silent = true })
set("x", "<c-u>", "20kzz", { noremap = true, silent = true })

set("n", "<leader>f", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>")
set("n", "<leader>c", "<cmd>call VSCodeNotify('editor.action.commentLine')<cr>")
set("x", "<leader>c", "<cmd>call VSCodeNotify('editor.action.commentLine')<cr>")
set("x", "<leader>s", "<cmd>call VSCodeNotify('editor.action.sortLinesAscending')<cr>")

-- lsp
set("n", "gD", "<cmd>call VSCodeNotify('editor.action.revealDeclaration')<cr>")
set("n", "gd", "<cmd>call VSCodeNotify('editor.action.revealDefinition')<cr>")
set("n", "gi", "<cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>")
set("n", "<leader>r", "<cmd>call VSCodeNotify('editor.action.rename')<cr>")
set("n", "<leader>a", "<cmd>call VSCodeNotify('hideCodeActionWidget')<cr>")
set("n", "<leader>dk", "<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>")
set("n", "<leader>dj", "<cmd>call VSCodeNotify('editor.action.marker.next')<cr>")
