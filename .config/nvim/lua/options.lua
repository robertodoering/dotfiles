-------------
-- options --
-------------

local set = vim.opt
local g = vim.g

set.number = true -- show line numbers
set.relativenumber = true -- relative line numbers
set.mouse = "a" -- enable mouse
-- set.wrap = false -- no softwrap
set.signcolumn = "yes" -- always show signcolumn
set.clipboard = "unnamedplus" -- use system clipboard
set.splitright = true -- open new vsplits to the right
set.splitbelow = true -- open new splits below
set.laststatus = 3 -- show the status line only on the last window
set.colorcolumn = "80"
set.swapfile = false
set.updatetime = 200
set.iskeyword:append("-") -- treat dash separated words as a single word
set.showmode = false -- hide mode text
set.hidden = false -- unload hidden buffers
set.autochdir = true --

-- search
set.hlsearch = false
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- case sensitive searching with capital letters

-- indentation
set.smartindent = true
set.expandtab = true -- insert spaces when pressing tab
set.tabstop = 2 -- use 2 spaces per tab
set.shiftwidth = 2 -- use 2 spaces for indentation

-- neovide gui configuration
if g.neovide then
  set.guifont = "firacode nerd font:h10"
  g.neovide_cursor_vfx_mode = "railgun"
  g.neovide_refresh_rate = 120
end
