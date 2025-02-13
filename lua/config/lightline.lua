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

