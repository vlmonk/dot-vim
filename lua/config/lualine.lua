require('lualine').setup({
  options = {
    theme = 'onedark',
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {
      {
        'filename',
        path = 4,
        shorting_target = 100,
        symbols = { modified = '𐎢', readonly = '𐎠' }
      },
    }
    ,
    lualine_c = {
      {
        'diagnostics',
        symbols = {
          error = 'ᚦ ', -- Thurisaz. Its spiky, thorn-like shape gives off a “danger” vibe, perfect for errors.
          warn = 'ᛉ ', -- Algiz. Often seen as a protective symbol, it nicely conveys caution.
          info = 'ᚨ ', -- Ansuz. Connected with communication and divine messages, ideal for info.
          hint = "ᛃ " -- Jera. With its cyclical, gentle feel, it works well for hints.
        },
      }, { 'lsp_progress', display_components = { 'lsp_client_name', 'spinner' }, }

    },
    lualine_x = {},
    lualine_y = { 'location' },
    lualine_z = {}
  },
  extensions = { 'fugitive', 'nvim-tree' }
})
