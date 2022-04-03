local actions = require "telescope.actions"

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
    buffers = {
      initial_mode = "normal",
      show_all_buffers = true,
      sort_lastused = true,
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
    }
  }
}

require("telescope").load_extension("fzf")

-- custom colors for telescope
vim.api.nvim_command("hi clear TelescopeMatching")
