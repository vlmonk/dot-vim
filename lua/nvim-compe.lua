vim.o.completeopt = "menuone,noselect"

local cmp = require'cmp'

cmp.setup({
  completion = { autocomplete = false },
  preselect = cmp.PreselectMode.Item,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping.close(),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<Space>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

--   -- Setup lspconfig.
--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--   capabilities.document_formatting = false
--   require('lspconfig')['tsserver'].setup {
--     -- capabilities = capabilities
--   }

function smart_tab()
    if cmp.visible() then
        cmp.select_next_item()
        return
    end

    local col = vim.fn.col(".") - 1

    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        vim.api.nvim_eval([[feedkeys("\<tab>", "n")]])
        return
    end
    
    cmp.complete()
end

vim.api.nvim_set_keymap('i', '<TAB>', "<cmd>lua smart_tab()<CR>", { silent = true })
-- vim.api.nvim_set_keymap('i', '<C-n>', 'compe#complete()', { silent = true, expr = true })
-- vim.api.nvim_set_keymap('i', '<Space>', "compe#confirm('<Space>')", { silent = true, expr = true })
