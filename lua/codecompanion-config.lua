require("codecompanion").setup({
  strategies = {
    chat = { adapter = "anthropic" },
    inline = { adapter = "anthropic" }
  },
  adapters = {
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
        schema = {
          model = {
            default = "claude-3-5-haiku-20241022",
          },
        },
      })
    end,
  },
  opts = {
    log_level = "DEBUG"
  },
  display = {
    action_palette = {
      width = 50,
      height = 10,
      prompt = "Prompt ", -- Prompt used for interactive LLM calls
      provider = "telescope", -- default|telescope|mini_pick
      opts = {
        show_default_actions = true, -- Show the default actions in the action palette?
        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
      },
    },
  },
  prompt_library = {
    ["Docusaurus"] = {
      strategy = "chat",
      description = "Write documentation for me",
      -- references = {
      --   {
      --     type = "buffer",
      --     path = #buffer,
      --   },
      -- },
      prompts = {
        {
          role = "user",
          content = [[
            Please add good documentation for code I provided. For reference, there are whole file content.
            Please output only documentation. Do not output my 

            WHOLE FILE CONTENT:
            ```
            #buffer
            ```

            CODE BLOCK TO ADD DOCS:
          ]]
        }
      }
    }
  }
})
