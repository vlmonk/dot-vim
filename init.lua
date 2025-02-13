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

require("keymaps")

-- Disable mappings for Enhanced Jumps
vim.g.EnhancedJumps_no_mappings = 1

-- Leader key
vim.g.mapleader = " "

-- Other Mappings
-------------------------------

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

-------------------------------
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

