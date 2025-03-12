return {
  -- LSP configuration
  "neovim/nvim-lspconfig",

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { "arkav/lualine-lsp-progress" },
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  -- Vim utilities
  "tpope/vim-surround",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "cespare/vim-toml",
  "mbbill/undotree",
  "famiu/bufdelete.nvim",
  "tpope/vim-haml",
  "slim-template/vim-slim",
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      notification = false,
      disabled_filetypes = {
        -- plugin default
        "aerial",
        "alpha",
        "Avante",
        "checkhealth",
        "dapui*",
        "db*",
        "Diffview*",
        "Dressing*",
        "fugitive",
        "help",
        "httpResult",
        "lazy",
        "lspinfo",
        "mason",
        "minifiles",
        "Neogit*",
        "neo%-tree*",
        "neotest%-summary",
        "netrw",
        "noice",
        "notify",
        "NvimTree",
        "oil",
        "prompt",
        "qf",
        "query",
        "TelescopePrompt",
        "Trouble",
        "trouble",
        "VoltWindow",
        "undotree",
        -- my custom type
        "vim"
      },
    }
  },

  -- Treesitter and related plugins
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Runs :TSUpdate after install/update
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  "RRethy/nvim-treesitter-textsubjects",

  -- Additional languages and utilities
  "kchmck/vim-coffee-script",
  "nvimtools/none-ls.nvim",
  "nvim-tree/nvim-tree.lua",
  "sindrets/diffview.nvim",
  "lewis6991/gitsigns.nvim",

  -- Test runner
  "vim-test/vim-test",

  -- Comments
  "tpope/vim-commentary",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Telescope and dependencies
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make", -- Runs "make" after cloning the repo
  },

  -- Enhanced jump and common library
  "inkarkat/vim-ingo-library",
  "inkarkat/vim-EnhancedJumps",

  -- Colorschemes
  "sainnhe/sonokai",
  "sainnhe/edge",

  -- Miscellaneous
  "michaeljsmith/vim-indent-object",
  "olimorris/codecompanion.nvim",

  --
  {
    'saghen/blink.cmp',
    version = '*',
    opts = require('config.blink'),
  }
}
