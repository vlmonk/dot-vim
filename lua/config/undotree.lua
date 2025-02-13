vim.keymap.set("n", "<leader>i", ":UndotreeShow<CR>:UndotreeFocus<CR>", { silent = true })
vim.keymap.set("n", "<leader>I", ":UndotreeHide<CR>",                 { silent = true })

vim.g.undotree_HighlightChangedWithSign = 1
vim.g.undotree_ShortIndicators          = 1
