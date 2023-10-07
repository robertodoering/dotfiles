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
  use "wbthomason/packer.nvim"

  -- lsp
  use "neovim/nvim-lspconfig"

  -- treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- flutter
  use { "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" }

  -- fuzzy finder
  use { "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }

  -- colorscheme
  use "ellisonleao/gruvbox.nvim"

  -- statusline
  use "nvim-lualine/lualine.nvim"

  -- toggle comments
  use "terrortylor/nvim-comment"

  -- file tree
  use { "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" }

  -- trim excess whitespaces on save
  use "cappyzawa/trim.nvim"
end)


-- lsp
-- https://github.com/neovim/nvim-lspconfig

local lspconfig = require("lspconfig")

lspconfig.dartls.setup {
  closingLabels = false,
  flutterOutline = false,

  on_init = function(client)
     client.config.settings.dart.analysisExcludedFolders = {
      vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
      -- path.join(flutter_sdk_path, "packages"),
      -- path.join(flutter_sdk_path, ".pub-cache"),
    }

    client.notify("workspace/didChangeConfiguration", {
      settings = client.config.settings,
    })
  end

    -- analysisExcludedFolders = {
    --   vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
    -- },
}

-- lspconfig.lua_ls.setup {
--   diagnostics = {
--     globals = { "vim", "use" },
--   },
--   telemetry = {
--     enable = false,
--   },
-- }


-- treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup {
  compilers = { "gcc" },
  ensure_installed = { "dart" },
  highlight = {
    enable = true,
  },
}


-- flutter tools
-- https://github.com/akinsho/flutter-tools.nvim

require("flutter-tools").setup {
  lsp = {
    settings = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
      },
    },
  },
}


-- trim
-- https://github.com/cappyzawa/trim.nvim

require("trim").setup {
  patterns = {
    [[%s/\s\+$//e]],          -- remove spaces at the end of each line
    [[%s/\($\n\s*\)\+\%$//]], -- trim empty lines at the end
    [[%s/\%^\n\+//]],         -- trim empty lines at the start
  },
}


-- telescope
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
      hidden = true,
    },
  },
}


-- colorscheme
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


-- lualine
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


-- comment
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


-- nvim-tree --
-- https://github.com/kyazdani42/nvim-tree.lua

-- disable netrw
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'l', api.node.open.edit,
    { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set('n', 'h', api.node.navigate.parent_close,
    { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

require("nvim-tree").setup {
  on_attach = nvim_tree_on_attach,

  reload_on_bufenter = true,
  hijack_cursor = true,      -- keep cursor on first letter of file name

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
  },
}
