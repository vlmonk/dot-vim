local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')

-- helper functions
local function expand_path(path)
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

-- rust
lspconfig.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = { command = "clippy", },
      -- cargo = { extraEnv = { RUSTUP_TOOLCHAIN = "nightly" } }
    }
  }
}

-- typescript 
local on_attach_tsserver = function(client)
  client.server_capabilities.documentFormattingProvider = false
  lsp_status.on_attach(client)
end

lspconfig.ts_ls.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  on_attach = on_attach_tsserver,
  capabilities = lsp_status.capabilities
})

-- ruby. rubocop && solargraph
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

-- lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- or the Lua version you use
      },
      diagnostics = {
        globals = { 'vim' }, -- Recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Optional: Disable automatic third-party library checks
      },
      -- Enable the built-in formatter
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- WTF?
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    severity_sort = true,
    virtual_text = { prefix = "→" }
  }
)

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
