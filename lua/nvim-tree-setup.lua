local api = require "nvim-tree.api"

local function opts(bufnr, desc)
  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

local function open_and_keep()
  local open_file = require("nvim-tree.actions.node.open-file")
  local saved_quit_on_open = open_file.quit_on_open

  open_file.quit_on_open = false
  api.node.open.edit()
  open_file.quit_on_open = saved_quit_on_open
  api.tree.open()
end

local function vsplit_and_keep()
  local mx = require("nvim-tree.actions.node.open-file")
  local saved_quit_on_open = mx.quit_on_open

  mx.quit_on_open = false
  api.node.open.vertical()
  mx.quit_on_open = saved_quit_on_open
  api.tree.open()
end

local function on_attach(bufnr)
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'v', api.node.open.vertical, opts(bufnr, "Vertical split"))
  vim.keymap.set('n', 'V', vsplit_and_keep, opts(bufnr, "Vertical split and keep"))

  vim.keymap.del('n', 'O', { buffer = bufnr })
  vim.keymap.set('n', 'O', open_and_keep, opts(bufnr,"Open and keep"))
end

  require("nvim-tree").setup {
    on_attach = on_attach,
    view = {
      side = "right",
      width = 45
    },
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = false,
        }
      }
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false
        }
      }
    }
  }
