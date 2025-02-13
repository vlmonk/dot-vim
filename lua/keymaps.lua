-- Leader key
vim.g.mapleader = " "

-- Exit terminal mode by ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
--
-- Fast edit / reload config
vim.keymap.set("n", "<leader>ce", ":new ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>cr", ":source ~/.config/nvim/init.lua<CR>")

-- Move current window to new tab
vim.keymap.set("n", "<C-W><C-T>", "<C-W>T")

-- Cycle buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })

-- Close current buffer
vim.keymap.set("n", "<leader>q", ":Bd<CR>", { silent = true })

-- Window splits
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>vs", ":split<CR>", { silent = true })
--
-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
--
-- Fugitive 
vim.keymap.set("n", "<leader>s",  "<cmd>Git<CR>",                  { silent = true })
vim.keymap.set("n", "<leader>fs", "<cmd>Gvdiffsplit<CR>",            { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Gvdiffsplit @<CR>",          { silent = true })
vim.keymap.set("n", "<leader>fo", "<cmd>Gvsplit :%<CR>",             { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Git blame<CR>",              { silent = true })
vim.keymap.set("n", "<leader>fp", "<cmd>Git push<CR>",               { silent = true })
vim.keymap.set("n", "<leader>fP", "<cmd>Git push -fu origin HEAD<CR>", { silent = true })

-- Diffview Mappings
vim.keymap.set("n", "<leader>fd", "<cmd>DiffviewOpen<CR>",           { silent = true })
vim.keymap.set("n", "<leader>fD", "<cmd>DiffviewOpen<CR>",           { silent = true })
vim.keymap.set("n", "<leader>fc", "<cmd>DiffviewClose<CR>",          { silent = true })
--
-- Map gl to jump to the end of a block (normal & visual modes)
vim.keymap.set("n", "gl", "$%", { silent = true })
vim.keymap.set("v", "gl", "$%", { silent = true })

-- Custom binding for Enhanced Jumps
vim.keymap.set("n", "<leader>o", "<Plug>EnhancedJumpsRemoteOlder", { silent = true })

-- Yank selected or current line to system clipboard
vim.keymap.set("v", "<leader>N", '"*y')
vim.keymap.set("n", "<leader>N", '0"*vy$', { silent = true })

-- Telescope & LSP Mappings
vim.keymap.set("n", "<leader>y", "<cmd>Telescope diagnostics bufnr=0<CR>", { silent = true })
vim.keymap.set("n", "<leader>Y", "<cmd>Telescope diagnostics<CR>",         { silent = true })
vim.keymap.set("n", "<leader>.", "<cmd>lua vim.diagnostic.goto_next()<CR>",    { silent = true })
vim.keymap.set("n", "<leader>,", "<cmd>lua vim.diagnostic.goto_prev()<CR>",    { silent = true })
vim.keymap.set("n", "<leader>z", "<cmd>Telescope lsp_document_symbols<CR>",    { silent = true })
vim.keymap.set("n", "<leader>Z", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { silent = true })
vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { silent = true })

vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>",  { silent = true })
vim.keymap.set("v", "<leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { silent = true })
vim.keymap.set("n", "K",         "<cmd>lua vim.lsp.buf.hover()<CR>",        { silent = true })
vim.keymap.set("n", "<leader>d", "<cmd>Telescope lsp_definitions<CR>",      { silent = true })
vim.keymap.set("n", "<leader>T", "<cmd>Telescope lsp_type_definitions<CR>", { silent = true })
vim.keymap.set("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<CR>",       { silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>Telescope lsp_references<CR>",       { silent = true })

vim.keymap.set("n", "<leader>p", ":Telescope git_files show_untracked=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>P", ":Telescope find_files cwd=" .. vim.fn.expand("%:p:h") .. "<CR>", { silent = true })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { silent = true })

vim.keymap.set("n", "<leader>G", "<cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>gv", "<cmd>Telescope resume<CR>",    { silent = true })

-- Live grep with default text using telescope
vim.keymap.set("n", "<leader>w", function()
  require('telescope.builtin').live_grep({
    default_text   = vim.fn.expand("<cword>"),
    initial_mode   = 'normal',
  })
end, { silent = true })

vim.keymap.set("n", "<leader>W", function()
  require('telescope.builtin').live_grep({
    default_text   = vim.fn.expand("<cWORD>"),
    initial_mode   = 'normal',
  })
end, { silent = true })


-- Code Companion
vim.keymap.set("n", "<leader>ll", "<cmd>CodeCompanionActions<CR>", { silent = true })
vim.keymap.set("v", "<leader>ll", "<cmd>CodeCompanionActions<CR>", { silent = true })

-- Navigate through quickfix list (next/previous entries)
vim.keymap.set('n', ']q', '<cmd>cnext<CR>')
vim.keymap.set('n', '[q', '<cmd>cprev<CR>')
