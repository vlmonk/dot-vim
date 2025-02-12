local function strip_trailing_whitespaces()
  local l = vim.fn.line(".")
  local c = vim.fn.col(".")
  vim.cmd("%s/\\s\\+$//e")
  vim.fn.cursor(l, c)
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    if ft:match("vim") or ft:match("ruby") or ft:match("python")
      or ft:match("haml") or ft:match("yaml") then
      strip_trailing_whitespaces()
    end
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "css", "scss" },
  callback = function()
    vim.opt_local.iskeyword:append("-")
  end,
})

-- Auto-reload on File Changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if not vim.fn.mode():match("[cr!t]") and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.cmd("echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None")
  end,
})

-- set vertical column for rust / ruby files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function() vim.opt_local.colorcolumn = "100" end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function() vim.opt_local.colorcolumn = "120" end,
})

-- Auto-formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rs", "*.json", "*.ts", "*.tsx", "*.js", "*.mjs", "*.jsx", "*.scss", "*.rb" },
  callback = function() vim.lsp.buf.format() end,
})

-- Markdown settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 90 -- Soft-wrap at 90 columns
    vim.opt_local.formatoptions:append("t") -- Enables automatic text wrapping
  end,
})
