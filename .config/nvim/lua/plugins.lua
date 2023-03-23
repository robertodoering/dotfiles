-------------
-- plugins --
-------------

------------
-- packer --
------------
-- https://github.com/hashicorp/packer

local packer = require("packer")

packer.init {
  autoremove = true,
  display = {
    open_fn = function()
      return require("packer.util").float {
        border = "none",
      }
    end,
  }
}

packer.startup(function()
  -- package manager
  use "wbthomason/packer.nvim"

  -- nvim lsp configuration
  use "neovim/nvim-lspconfig"

  -- treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- colorscheme
  use "ellisonleao/gruvbox.nvim"

  -- trim excess whitespaces on save
  use "cappyzawa/trim.nvim"

  -- fuzzy finder
  use { "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }

  -- statusline
  use "nvim-lualine/lualine.nvim"

  -- git integration
  use "lewis6991/gitsigns.nvim"

  -- toggleable terminal
  use "akinsho/nvim-toggleterm.lua"

  -- toggle comments
  use "terrortylor/nvim-comment"

  -- file tree
  use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }

  -- greeter
  use { "goolord/alpha-nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- flutter
  use { "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" }

  -- cmp autocomplete & snippets
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
end)


----------------
-- treesitter --
----------------
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "rust", "c", "dart" },
  highlight = {
    enable = true,
  },
}


---------
-- lsp --
---------
-- https://github.com/neovim/nvim-lspconfig

local nvim_lsp = require("lspconfig")

local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim', 'use' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-------------------
-- cmp & luasnip --
-------------------
-- https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<c-k>"] = cmp.mapping.select_prev_item(),
    ["<c-j>"] = cmp.mapping.select_next_item(),
    ["<c-l>"] = cmp.mapping.confirm(),

    ["<up>"] = cmp.mapping.select_prev_item(),
    ["<down>"] = cmp.mapping.select_next_item(),
    ["<right>"] = cmp.mapping.confirm(),

    ["<cr>"] = cmp.mapping.confirm { select = false },

    ["<tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<s-tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
}

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})


-----------------
-- colorscheme --
-----------------
-- https://github.com/ellisonleao/gruvbox.nvim

require("gruvbox").setup {
  italic = {
    strings = false,
    operators = false,
    comments = false,
    folds = false,
  },
  invert_selection = true,
  contrast = "hard",
}

vim.cmd("colorscheme gruvbox")


----------
-- trim --
----------
-- https://github.com/cappyzawa/trim.nvim

require("trim").setup {
  patterns = {
    [[%s/\s\+$//e]], -- remove spaces at the end of each line
    [[%s/\($\n\s*\)\+\%$//]], -- trim empty lines at the end
    [[%s/\%^\n\+//]], -- trim empty lines at the start
  },
}


---------------
-- telescope --
---------------
-- https://github.com/nvim-telescope/telescope.nvim

local telescope_actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close,
        ["<c-k>"] = telescope_actions.move_selection_previous,
        ["<c-j>"] = telescope_actions.move_selection_next,
        ["<c-l>"] = telescope_actions.select_default,
        ["<right>"] = telescope_actions.select_default,
      }
    }
  },
  pickers = {
    find_files = {
      -- theme = "dropdown",
      hidden = true,
    },
    -- oldfiles = {
    --   theme = "dropdown",
    -- },
    -- buffers = {
    --   theme = "dropdown",
    -- },
    -- lsp_document_symbols = {
    --   theme = "dropdown",
    -- },
    -- git_status = {
    --   theme = "dropdown",
    -- }
  },
}


-------------
-- lualine --
-------------
-- https://github.com/nvim-lualine/lualine.nvim

local to_lower = function(str)
  return str:lower()
end

require("lualine").setup {
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { { "mode", fmt = to_lower } },
    lualine_b = { "branch", "diff", { "diagnostics", fmt = to_lower } },
    lualine_c = { "filename" },
    lualine_x = { "encoding" },
    lualine_y = { "filetype" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


--------------
-- gitsigns --
--------------
-- https://github.com/lewis6991/gitsigns.nvim

require("gitsigns").setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
}


----------------
-- toggleterm --
----------------
-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  shade_terminals = false,
}


-------------------
-- flutter-tools --
-------------------
-- https://github.com/akinsho/flutter-tools.nvim

require("flutter-tools").setup {
  ui = {
    border = "none",
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    enabled = false,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      foreground = false,
      virtual_text = false,
      virtual_text_str = "■",
    },
    capabilities = capabilities,
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = false,
      completeFunctionCalls = true,
      renameFilesWithClasses = "prompt",
      enableSnippets = true,
    }
  }
}


-------------
-- comment --
-------------
-- https://github.com/terrortylor/nvim-comment

require("nvim_comment").setup {
  -- line_mapping = "<leader>cc",
  -- operator_mapping = "<leader>c",
  comment_empty = true,
  marker_padding = true,
  create_mappings = true,
  comment_empty_trim_whitespace = true,
  hook = nil,
}


---------------
-- nvim-tree --
---------------
-- https://github.com/kyazdani42/nvim-tree.lua

require("nvim-tree").setup {
  reload_on_bufenter = true,
  hijack_cursor = true, -- keep cursor on first letter of file name

  sync_root_with_cwd = true, -- update tree root when cwd changes

  -- focus selected file
  update_focused_file = {
    enable = true,
  },

  diagnostics = {
    enable = true,
    icons = {
      hint = 'h',
      info = 'i',
      warning = 'w',
      error = 'e',
    },
  },

  renderer = {
    highlight_git = true,
    highlight_opened_files = "all",
    root_folder_modifier = ":t",

    special_files = {
      "Cargo.toml",
      "Makefile",
      "README.md",
      "readme.md",
      "pubspec.yaml",
    },

    icons = {
      glyphs = {
        git = {
          unstaged = "*",
          staged = "*",
          unmerged = "u",
          renamed = "r",
          untracked = "*",
          deleted = "-",
          ignored = "◌",
        },
      },
    },
  },

  view = {
    signcolumn = "no", -- no sign column on the left
    mappings = {
      list = {
        { key = { "l", "<cr>", "o" }, cb = require("nvim-tree.config").nvim_tree_callback("edit") },
        { key = "h", cb = require("nvim-tree.config").nvim_tree_callback("close_node") },
      },
    },
  },
}
