vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = false;
  min_length = 1;
  preselect = 'always';
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

function smart_tab()
    if vim.fn.pumvisible() ~= 0 then
        vim.api.nvim_eval([[feedkeys("\<c-n>", "n")]])
        return
    end

    local col = vim.fn.col(".") - 1

    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        vim.api.nvim_eval([[feedkeys("\<tab>", "n")]])
        return
    end

    vim.fn["compe#complete"]();
end

vim.api.nvim_set_keymap('i', '<TAB>', "<cmd>lua smart_tab()<CR>", { silent = true })
vim.api.nvim_set_keymap('i', '<C-n>', 'compe#complete()', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<Space>', "compe#confirm('<Space>')", { silent = true, expr = true })
