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
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
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
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  on_attach = on_attach_tsserver,
  root_dir = function(bufnr)
    return vim.fs.root(bufnr, { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' })
  end,
})

-- ruby. rubocop && solargraph
vim.lsp.config('rubocop', {
  cmd = { bundle, 'exec', 'rubocop', '--lsp' },
  filetypes = { 'ruby' },
})

vim.lsp.config('solargraph', {
  cmd = { bundle, "exec", "solargraph", "stdio" },
  filetypes = { 'ruby' },
  settings = {
    solargraph = {
      logLevel = "info",
      diagnostics = true,
      useBundler = true
    }
  }
})

vim.lsp.config('ruby_lsp', {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' },
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
  },
})

-- lua
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
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
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose' },
  settings = {
    yaml = {
      format = {
        enabled = true
      },
    },
  },
})

-- Auto-start LSP servers using autocommands
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  callback = function(args)
    vim.lsp.start({
      name = 'ts_ls',
      cmd = { 'typescript-language-server', '--stdio' },
      root_dir = vim.fs.root(args.buf, { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' }),
    })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function(args)
    vim.lsp.start({ name = 'rust_analyzer' })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ruby',
  callback = function(args)
    vim.lsp.start({ name = 'rubocop' })
    vim.lsp.start({ name = 'solargraph' })
    vim.lsp.start({ name = 'ruby_lsp' })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function(args)
    vim.lsp.start({ name = 'lua_ls' })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'yaml.docker-compose' },
  callback = function(args)
    vim.lsp.start({ name = 'yamlls' })
  end,
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
