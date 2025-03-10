vim.opt.signcolumn = "yes" -- always show signcolumn
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 1
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.fileencodings = { "utf-8" }
vim.opt.laststatus = 3 -- global statusline
vim.opt.mouse = ""  -- disable mouse
vim.opt.colorcolumn = {"80", "120"}
vim.opt.splitright = true
vim.opt.completeopt = {"menuone", "noselect"}
vim.opt.updatetime = 100

-- netrw config
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
