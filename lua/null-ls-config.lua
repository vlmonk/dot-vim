local null_ls = require("null-ls");

local sources = {
  null_ls.builtins.formatting.prettier.with({
    prefer_local = "node_modules/.bin"
  })
}

null_ls.setup({ sources = sources })
