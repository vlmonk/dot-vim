function expand_path(path)
    -- Check if the path starts with '~'
    if path:sub(1,1) == '~' then
        -- Replace '~' with the content of the HOME environment variable
        local home = os.getenv("HOME")
        if home then
            path = home .. path:sub(2)
        else
            error("HOME environment variable not set")
        end
    end
    return path
end

local bundle = expand_path("~/.rbenv/shims/bundle")

local lsp_status = require('lsp-status')

lsp_status.config({
  status_symbol = '',
  indicator_errors = 'ᛓ',
  indicator_warnings = 'ᚼ',
  indicator_info = 'ᛊ',
  indicator_hint = 'ᛘ',
  indicator_ok = '',
  indicator_separator = '',
})

lsp_status.register_progress()

local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup{}

local on_attach_tsserver = function(client)
  client.server_capabilities.documentFormattingProvider= false
  lsp_status.on_attach(client)
end

lspconfig.tsserver.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  on_attach = on_attach_tsserver,
  capabilities = lsp_status.capabilities
})

lspconfig.rubocop.setup({
  cmd = { bundle, 'exec', 'rubocop', '--lsp' },
})


lspconfig.solargraph.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,

  cmd = { bundle, "exec", "solargraph", "stdio" },

  settings = {
    solargraph = {
      logLevel = "info",
      diagnostics = true,
      useBundler = true
    }
  }
})
