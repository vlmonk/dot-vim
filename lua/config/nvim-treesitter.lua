require('nvim-treesitter.configs').setup {
  sync_install = false,
  auto_install = true,
  ignore_install = { },
  modules = {},
  ensure_installed = {
    'bash',
    'css',
    'diff',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'nginx',
    'ruby',
    'rust',
    'sql',
    'ssh_config',
    'terraform',
    'tsx',
    'typescript',
    'vimdoc',
  },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      -- disable it
      lookahead = false,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["aB"] = "@block.outer",
        ["iB"] = "@block.inner",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
      },
    },
  },
  indent = {
    enable = false
  },
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  }
}
