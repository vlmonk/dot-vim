return {
  -- LSP configuration
  "neovim/nvim-lspconfig",

   -- Autocompletion plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-path",

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
  "nvim-lua/lsp-status.nvim",
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {}
  },

  -- Treesitter and related plugins
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Runs :TSUpdate after install/update
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
  { "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",  -- Runs "make" after cloning the repo
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
}
