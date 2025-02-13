vim.g["test#strategy"] = "neovim"

vim.keymap.set("n", "<leader>m", "<cmd>TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>M", "<cmd>TestFile<CR>",    { silent = true })
