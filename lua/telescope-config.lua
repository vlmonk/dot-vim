local actions = require "telescope.actions"
local utils = require "telescope.utils"
local Path = require "plenary.path"

local lsp_entry = function(entry) 
  local filename = entry.filename or vim.api.nvim_buf_get_name(entry.bufnr)
  local cwd = vim.loop.cwd()
  local short_name = Path:new(filename):make_relative(cwd)
  local display = utils.transform_path({path_display = {'smart', 'absolute' }}, short_name)

  return {
    valid = true,

    value = entry,
    ordinal =  display,
    display = display,

    bufnr = entry.bufnr,
    filename = filename,
    lnum = entry.lnum,
    col = entry.col,
    text = entry.text,
    start = entry.start,
    finish = entry.finish,
  }
end

require("telescope").setup {
  defaults = {
    file_ignore_patterns = {"node_modules", "tmp", "target"},
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<enter>"] = function () vim.cmd("stopinsert") end
      },
      n = {
        ["/"] = function () vim.cmd("startinsert") end,
        ["s"] = actions.select_horizontal,
        ["v"] = actions.select_vertical,
        ["t"] = actions.select_tab,
      }
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = "ivy",
    },
    git_files = {
      previewer = false,
      theme = "ivy",
    },
    resume = {
      initial_mode = "normal"
    },
    live_grep = {
      disable_coordinates = true
    },
    buffers = {
      initial_mode = "normal",
      show_all_buffers = true,
      sort_lastused = false,
      theme = "dropdown",
      previewer = false,
      layout_config = {
        width = 0.5
      },
      mappings = {
        n = {
          ["dd"] = "delete_buffer",
        }
      }
    },
    lsp_references = {
      theme = "ivy",
      entry_maker = lsp_entry 
    }
  }
}

require("telescope").load_extension("fzf")

-- custom colors for telescope
vim.api.nvim_command("hi clear TelescopeMatching")
