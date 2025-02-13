vim.opt.background = "dark"

vim.g.sonokai_style = "andromeda"
vim.g.sonokai_enable_italic = 1

vim.cmd("colorscheme sonokai")

vim.cmd("highlight! link TSPunctBracket Blue")
vim.cmd("highlight Search guibg=transparent guifg=#fa7dfa")
vim.cmd("highlight SignColumn guibg=transparent")
vim.cmd("highlight Comment gui=italic")
vim.cmd("highlight VertSplit guifg=#9e9d9d guibg=none")
vim.cmd("highlight clear ErrorMsg")
vim.cmd("highlight ErrorMsg guifg=#ffa6b3 guibg=transparent")
vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=#342F3E")
vim.cmd("highlight LspDiagnosticsSignError guifg=#DE0000 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextErro guifg=#DE0000 ctermfg=White")
vim.cmd("highlight LspDiagnosticsSignWarning guifg=#FFAE57 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextWarning guifg=#FFAE57 ctermfg=White")
vim.cmd("highlight LspDiagnosticsSignHint guifg=#B3B3B3 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextHint guifg=#B3B3B3 ctermfg=White")
vim.cmd("highlight LspDiagnosticsSignInformation guifg=#B3B3B3 ctermfg=White")
vim.cmd("highlight LspDiagnosticsVirtualTextInformation guifg=#B3B3B3 ctermfg=White")

