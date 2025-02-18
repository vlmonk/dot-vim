require("codecompanion").setup({
  strategies = {
    chat = {
      keymaps = {
        options = {
          modes = { n = 'g?' },
          callback = "keymaps.options",
          description = "Options",
          hide = true,
        }
      },
      adapter = "nebius",
      slash_commands = {
        ["file"] = { opts = { provider = "telescope" } },
        ["buffer"] = { opts = { provider = "telescope" } },
        ["symbols"] = { opts = { provider = "telescope" } },
      },
    },
    inline = { adapter = "anthropic" }
  },
  adapters = {
    nebius = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "https://api.studio.nebius.ai/v1/",
          api_key = "NEBIUS_API_KEY",
          chat_url = "chat/completions",
        },
        schema = {
          model = {
            choices = {
              "deepseek-ai/DeepSeek-R1-fast",
            },
            default = "deepseek-ai/DeepSeek-R1-fast",
          },
        },
      })
    end,
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
      prompt = "Prompt ",                 -- Prompt used for interactive LLM calls
      provider = "telescope",               -- default|telescope|mini_pick
      opts = {
        show_default_actions = true,        -- Show the default actions in the action palette?
        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
      },
    },
  },
  prompt_library = {
    ["Docusaurus"] = {
      strategy = "chat",
      description = "Write documentation for me",
      opts = { adapter = "deepseek-reasoner", },
      prompts = {
        {
          role = "system",
          content = [[
I want you to act as an expert developer specializing in creating clear and concise code documentation.
I will provide you with a snippet of code, and your task is to generate documentation that explains its
functionality, usage, and key details. Please adhere to the following guidelines:

- Return only the documentation: Do not include the original code in your response.
- Ruby code: Format the documentation using the YARD style.
- Rust code: Exclude any “Example” sections from the documentation.

Focus on making the documentation informative and easy to understand for developers.
]]
        },
        {
          role = "user",
          content = [[
For context, please check buffer content #buffer

Please generate documentation for the following code:

]]
        },
      }
    }
  }
})
