require("config.lazy")

require("core.options")
require("core.autocmds")

require("config.codecompanion")
require("config.telescope")
require("config.lsp")
require("config.gitsigns")
require("config.lsp-status")
require("config.null-ls")
require("config.cmp")
require("config.nvim-tree")
require("config.nvim-treesitter")

require("utils.prettify-json")
require("utils.load-env")
load_vim_env()  -- assuming this is defined globally

-- Disable mappings for Enhanced Jumps
vim.g.EnhancedJumps_no_mappings = 1

-- Leader key
vim.g.mapleader = " "

-------------------------------
-- Terminal & Editing Mappings
-------------------------------
-- Exit terminal mode by ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Fast edit / reload config
vim.keymap.set("n", "<leader>ce", ":new ~/.config/nvim/init.vim<CR>")
vim.keymap.set("n", "<leader>cr", ":source ~/.config/nvim/init.vim<CR>")

-- Move current window to new tab
vim.keymap.set("n", "<C-W><C-T>", "<C-W>T")

-- Cycle buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })

-- Close current buffer
vim.keymap.set("n", "<leader>q", ":Bd<CR>", { silent = true })

-- Window splits
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>vs", ":split<CR>", { silent = true })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-------------------------------
-- Fugitive & Diffview Mappings
-------------------------------
vim.keymap.set("n", "<leader>s",  "<cmd>Git<CR>",                  { silent = true })
vim.keymap.set("n", "<leader>fs", "<cmd>Gvdiffsplit<CR>",            { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Gvdiffsplit @<CR>",          { silent = true })
vim.keymap.set("n", "<leader>fo", "<cmd>Gvsplit :%<CR>",             { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Git blame<CR>",              { silent = true })
vim.keymap.set("n", "<leader>fp", "<cmd>Git push<CR>",               { silent = true })
vim.keymap.set("n", "<leader>fP", "<cmd>Git push -fu origin HEAD<CR>", { silent = true })

vim.keymap.set("n", "<leader>fd", "<cmd>DiffviewOpen<CR>",           { silent = true })
vim.keymap.set("n", "<leader>fD", "<cmd>DiffviewOpen<CR>",           { silent = true })
vim.keymap.set("n", "<leader>fc", "<cmd>DiffviewClose<CR>",          { silent = true })

-------------------------------
-- Other Mappings
-------------------------------
-- Map gl to jump to the end of a block (normal & visual modes)
vim.keymap.set("n", "gl", "$%", { silent = true })
vim.keymap.set("v", "gl", "$%", { silent = true })

-- Custom binding for Enhanced Jumps
vim.keymap.set("n", "<leader>o", "<Plug>EnhancedJumpsRemoteOlder", { silent = true })

-------------------------------
-- Netrw & Colors
-------------------------------
vim.g.netrw_banner   = 0
vim.g.netrw_liststyle  = 3

vim.opt.background = "dark"

vim.g.sonokai_style         = "andromeda"
vim.g.sonokai_enable_italic = 1
vim.cmd("colorscheme sonokai")
vim.cmd("highlight! link TSPunctBracket Blue")

vim.cmd("highlight Search guibg=transparent guifg=#fa7dfa")
vim.cmd("highlight SignColumn guibg=transparent")
vim.cmd("highlight Comment gui=italic")

-------------------------------
-- Update Time & Yank Mappings
-------------------------------
vim.opt.updatetime = 100

vim.keymap.set("v", "<leader>N", '"*y')
vim.keymap.set("n", "<leader>N", '0"*vy$', { silent = true })

-------------------------------
-- Telescope & LSP Mappings
-------------------------------
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

-- Live grep with default text (using telescope.builtin)
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

-------------------------------
-- Test Runner & Undotree
-------------------------------
vim.g["test#strategy"] = "neovim"
vim.keymap.set("n", "<leader>m", "<cmd>TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>M", "<cmd>TestFile<CR>",    { silent = true })

vim.keymap.set("n", "<leader>i", ":UndotreeShow<CR>:UndotreeFocus<CR>", { silent = true })
vim.keymap.set("n", "<leader>I", ":UndotreeHide<CR>",                 { silent = true })
vim.g.undotree_HighlightChangedWithSign = 1
vim.g.undotree_ShortIndicators          = 1

-------------------------------
-- Code Companion
-------------------------------
vim.keymap.set("n", "<leader>ll", "<cmd>CodeCompanionActions<CR>", { silent = true })
vim.keymap.set("v", "<leader>ll", "<cmd>CodeCompanionActions<CR>", { silent = true })

-------------------------------
-- Lightline & LSP Status
-------------------------------
-- Define a global function (available as LspStatus) for use in lightline
_G.LspStatus = function()
  if #vim.lsp.buf_get_clients() > 0 then
    return require("lsp-status").status()
  end
  return ""
end

vim.g.lightline = {
  active = {
    left  = { { "mode", "paste" }, { "readonly", "filename", "modified" }, { "LspStatus" } },
    right = { { "lineinfo" }, { "percent" } },
  },
  component_function = {
    LspStatus = "LspStatus",
  },
}

-------------------------------
-- Custom Text Objects
-------------------------------
vim.keymap.set("x", "il", ":<C-u>normal! g_v^<CR>", { silent = true })
vim.keymap.set("o", "il", ":<C-u>normal! g_v^<CR>", { silent = true })

-------------------------------
-- Appearance: Split, Fillchars, and Error Styles
-------------------------------
vim.cmd("highlight VertSplit guifg=#9e9d9d guibg=none")
vim.cmd("highlight clear ErrorMsg")
vim.cmd("highlight ErrorMsg guifg=#ffa6b3 guibg=transparent")

-------------------------------
-- Undo History (Persistent Undo)
-------------------------------
local vimDir = os.getenv("HOME") .. "/.vim"
if not string.find(vim.o.runtimepath, vimDir, 1, true) then
  vim.opt.runtimepath:append(vimDir)
end

if vim.fn.has("persistent_undo") == 1 then
  local myUndoDir = vimDir .. "/undodir-v5"
  os.execute("mkdir -p " .. vimDir)
  os.execute("mkdir -p " .. myUndoDir)
  vim.opt.undodir  = myUndoDir
  vim.opt.undofile = true
end

-------------------------------
-- Format as JSON
-------------------------------
function _G.FormatAsJson()
  vim.bo.filetype = "json"
  vim.cmd("Format")
end
vim.keymap.set("n", "<leader>ff", "<cmd>lua FormatAsJson()<CR>", { silent = true })

vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=#342F3E")

-------------------------------
-- NvimTree & HardTime Mappings
-------------------------------
vim.keymap.set("n", "<leader>t", "<Cmd>NvimTreeFindFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>S", "<Cmd>lua vim.g.hardtime_showmsg = 1; HardTimeToggle(); vim.g.hardtime_showmsg = 0<CR>", { silent = true })

                        
-------------------------------
-- Diagnostic Signs
-------------------------------
vim.fn.sign_define("LspDiagnosticsSignError", {
  text    = "→",
  texthl  = "LspDiagnosticsSignError",
  linehl  = "",
  numhl   = "",
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
  text    = "→",
  texthl  = "LspDiagnosticsSignWarning",
  linehl  = "",
  numhl   = "",
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
  text    = "→",
  texthl  = "LspDiagnosticsSignInformation",
  linehl  = "",
  numhl   = "",
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
  text    = "→",
  texthl  = "LspDiagnosticsSignHint",
  linehl  = "",
  numhl   = "",
})

vim.cmd("highlight LspDiagnosticsSignError guifg=#DE0000 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextErro guifg=#DE0000 ctermfg=White")
vim.cmd("highlight LspDiagnosticsSignWarning guifg=#FFAE57 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextWarning guifg=#FFAE57 ctermfg=White")
vim.cmd("highlight LspDiagnosticsSignHint guifg=#B3B3B3 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextHint guifg=#B3B3B3 ctermfg=White")
vim.cmd("highlight LspDiagnosticsSignInformation guifg=#B3B3B3 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextInformation guifg=#B3B3B3 ctermfg=White")

vim.keymap.set('n', ']q', '<cmd>cnext<CR>')
vim.keymap.set('n', '[q', '<cmd>cprev<CR>')
