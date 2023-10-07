-- options

vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.mouse = "a" -- enable mouse
vim.opt.swapfile = false
vim.opt.updatetime = 200
vim.opt.iskeyword:append("-") -- treat dash separated words as a single word
vim.opt.hidden = false -- unload hidden buffers

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- case sensitive searching with capital letters

-- indentation
vim.opt.smartindent = true
vim.opt.expandtab = true -- insert spaces when pressing tab
vim.opt.tabstop = 2 -- use 2 spaces per tab
vim.opt.shiftwidth = 2 -- use 2 spaces for indentation


-- keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- center on c-d/u
vim.keymap.set("n", "<c-d>", "20jzz", { noremap = true, silent = true })
vim.keymap.set("n", "<c-u>", "20kzz", { noremap = true, silent = true })
vim.keymap.set("x", "<c-d>", "20jzz", { noremap = true, silent = true })
vim.keymap.set("x", "<c-u>", "20kzz", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>f", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>call VSCodeNotify('editor.action.commentLine')<cr>")
vim.keymap.set("x", "<leader>c", "<cmd>call VSCodeNotify('editor.action.commentLine')<cr>")
vim.keymap.set("x", "<leader>s", "<cmd>call VSCodeNotify('editor.action.sortLinesAscending')<cr>")

-- prevent yanking on paste
vim.keymap.set("x", "p", "P", { noremap = true, silent = true })

-- lsp
vim.keymap.set("n", "gD", "<cmd>call VSCodeNotify('editor.action.revealDeclaration')<cr>")
vim.keymap.set("n", "gd", "<cmd>call VSCodeNotify('editor.action.revealDefinition')<cr>")
vim.keymap.set("n", "gi", "<cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>")
vim.keymap.set("n", "<leader>r", "<cmd>call VSCodeNotify('editor.action.rename')<cr>")
vim.keymap.set("n", "<leader>a", "<cmd>call VSCodeNotify('hideCodeActionWidget')<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>")
vim.keymap.set("n", "<leader>dj", "<cmd>call VSCodeNotify('editor.action.marker.next')<cr>")
