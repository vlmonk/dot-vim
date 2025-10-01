local null_ls = require("null-ls");

local sources = {
  null_ls.builtins.formatting.prettier.with({
    prefer_local = "node_modules/.bin",
    extra_args = { "--ignore-path", "''" },
    filetypes = {
      "less", "yaml", "javascript", "javascriptreact", "graphql", "typescriptreact",
      "html", "css", "vue", "scss", "svelte", "typescript", "handlebars", "jsonc", "json"
    }
  }),
  null_ls.builtins.diagnostics.yamllint
}

null_ls.setup({ sources = sources })
