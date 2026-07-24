-- nvim-treesitter "main" branch: no configs.setup(), features are enabled
-- per-buffer from a FileType autocmd (see :h treesitter-highlight).

local ensure_installed = {
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
}

require('nvim-treesitter').install(ensure_installed)

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('my.treesitter', {}),
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang or not vim.tbl_contains(require('nvim-treesitter.config').get_available(), lang) then
      return
    end
    -- install is a no-op if the parser is already there (auto_install behavior)
    require('nvim-treesitter').install(lang):await(function()
      if vim.api.nvim_buf_is_valid(args.buf) then
        pcall(vim.treesitter.start, args.buf, lang)
      end
    end)
  end,
})
