-- Context-aware commentstring for native gc/gcc commenting (Nvim 0.10+).
-- Makes comments inside jsx/tsx blocks use {/* */} instead of //.

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  return option == 'commentstring'
      and require('ts_context_commentstring.internal').calculate_commentstring()
      or get_option(filetype, option)
end
