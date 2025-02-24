local function smart_tab(cmp)
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".") - 1
  local text_before_cursor = line:sub(1, col)

  -- If there's any non-whitespace character in text_before_cursor,
  -- return false so the completion chain (show/select_next) is used.
  if text_before_cursor:match("%S") then
    return false
  end

  -- Otherwise, only whitespace so insert a real tab.
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes("<Tab>", true, true, true),
    "n",
    false
  )
  return true
end



---@module 'blink.cmp'
---@type blink.cmp.Config
local M = {
  keymap = {
    preset      = 'none',
    ['<Tab>']   = { smart_tab, 'show', 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev' },
    ['<Space>'] = { 'select_and_accept', 'fallback' },
    ['<Esc>']   = { 'cancel', 'fallback' },
  },
  completion = {
    menu = {
      auto_show = false,
    }
  },
  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },
  cmdline = {
    enabled = true,
    sources = { 'cmdline' },
    keymap = {
      ['<Tab>'] = { 'show', 'select_next' },
      ['<Space>'] = { 'select_and_accept', 'fallback' },
    }
  },
}

return M
