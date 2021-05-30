vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = false;
  min_length = 1;
  preselect = 'enable';
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", { silent = true, expr = true })
