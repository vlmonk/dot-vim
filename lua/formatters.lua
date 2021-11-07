function prettier () 
  return {
    exe = "./node_modules/.bin/prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
    stdin = true
  }
end

require('formatter').setup({
  filetype = {
    typescript = { prettier },
    json = { prettier }
  }
})
