-- https://stackoverflow.com/questions/4990990/check-if-a-file-exists-with-lua

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
 end

function prettier_json () 
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote", "--parser json"},
    stdin = true
  }
end

function prettier_scss () 
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote", "--parser scss"},
    stdin = true
  }
end

function prettier () 
  local path = file_exists("./node_modules/.bin/prettier") and "./node_modules/.bin/prettier" or "prettier"

  return {
    exe = path,
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true
  }
end

require('formatter').setup({
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    json = { prettier_json },
    scss = { prettier_scss }
  }
})
