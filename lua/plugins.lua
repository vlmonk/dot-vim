return {
  -- Status line
  'nvim-lualine/lualine.nvim',

  -- Vim utilities
  "tpope/vim-surround",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
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
    branch = "main",
    build = ":TSUpdate", -- Runs :TSUpdate after install/update
  },

  -- Additional languages and utilities
  "nvimtools/none-ls.nvim",
  "nvim-tree/nvim-tree.lua",
  "sindrets/diffview.nvim",
  "lewis6991/gitsigns.nvim",

  -- Test runner
  "vim-test/vim-test",

  -- Comments (native gc/gcc since Nvim 0.10; this makes commentstring
  -- context-aware inside tsx/jsx, see config/commentstring.lua)
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

  -- Colorschemes
  "sainnhe/sonokai",
  "sainnhe/edge",
  { "uloco/bluloco.nvim",
  dependencies = { 'rktjmp/lush.nvim' }

},

  -- Miscellaneous
  "michaeljsmith/vim-indent-object",

  --
  {
    'saghen/blink.cmp',
    version = '*',
    opts = require('config.blink'),
  }
}
