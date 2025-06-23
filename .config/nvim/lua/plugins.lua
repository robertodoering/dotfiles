--
-- mini.nvim
--
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    '--branch', 'stable',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

--
-- mini.deps
--
require('mini.deps').setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

--
-- plugins
--
now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.statusline').setup() end)

now(function()
  add({ source = 'ellisonleao/gruvbox.nvim' })

  require('gruvbox').setup({
    italic = {
      strings = false,
      emphasis = false,
      comments = false,
    },
    invert_selection = true,
    inverse = true,
    contrast = 'hard',
  })
  vim.o.termguicolors = true
  vim.o.background = 'dark'
  vim.cmd([[colorscheme gruvbox]])
end)

later(function() require('mini.pairs').setup() end)
later(function() require('mini.comment').setup() end)
later(function()
  require('mini.completion').setup({
    delay = { completion = 100, info = 0, signature = 0 },
    mappings = {
      scroll_down = '',
      scroll_up = '',
    },
  })

  vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
  vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
end)

now(function()
  add({ source = 'neovim/nvim-lspconfig' })

  vim.lsp.enable('pyright')

  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", { noremap = true, silent = true })

  vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.setloclist()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>dK", "<cmd>lua vim.diagnostic.open_float()<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.jump({count=-1, float=true, severity=vim.diagnostic.severity.ERROR})<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.jump({count=1, float=true, severity=vim.diagnostic.severity.ERROR})<cr>", { noremap = true, silent = true })
end)

later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })

  require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
  })
end)
