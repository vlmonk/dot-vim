-- helper functions
local function expand_path(path)
  -- Check if the path starts with '~'
  if path:sub(1, 1) == '~' then
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
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = { command = "clippy", },
      -- cargo = { extraEnv = { RUSTUP_TOOLCHAIN = "nightly" } }
    }
  }
})

-- typescript
local on_attach_tsserver = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

vim.lsp.config('ts_ls', {
  on_attach = on_attach_tsserver,
})

-- ruby. rubocop && solargraph
vim.lsp.config('rubocop', {
  cmd = { bundle, 'exec', 'rubocop', '--lsp' },
})

vim.lsp.config('solargraph', {
  cmd = { bundle, "exec", "solargraph", "stdio" },

  settings = {
    solargraph = {
      logLevel = "info",
      diagnostics = true,
      useBundler = true
    }
  }
})

vim.lsp.config('ruby_lsp', {
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
  },
})

-- lua
vim.lsp.config('lua_ls', {
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
})

vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      format = {
        enabled = true
      },
    },
  },
})

-- Enable all configured LSP servers
vim.lsp.enable({
  'rust_analyzer',
  'ts_ls',
  'rubocop',
  'solargraph',
  'ruby_lsp',
  'lua_ls',
  'yamlls',
})

-- Diagnostic signs configuration
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '→',
      [vim.diagnostic.severity.WARN] = '→',
      [vim.diagnostic.severity.INFO] = '→',
      [vim.diagnostic.severity.HINT] = '→',
    },
  },
})
