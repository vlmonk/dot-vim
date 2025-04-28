local fmt = string.format

local constants = {
  LLM_ROLE = "llm",
  USER_ROLE = "user",
  SYSTEM_ROLE = "system",
}

local function system_prompt(_opts)
  return [[
You are an AI programming assistant named "CodeCompanion". You are currently plugged in to the Neovim text editor on a user's machine.

Your core tasks include:
- Answering general programming questions.
- Explaining how the code in a Neovim buffer works.
- Reviewing the selected code in a Neovim buffer.
- Generating unit tests for the selected code.
- Proposing fixes for problems in the selected code.
- Scaffolding code for a new workspace.
- Finding relevant code to the user's query.
- Proposing fixes for test failures.
- Running tools.

You must:
- Follow the user's requirements carefully and to the letter.
- Keep your answers short and impersonal, especially if the user responds with context outside of your tasks.
- Minimize other prose.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of the Markdown code blocks.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's relevant to the task at hand. You may not need to return all of the code that the user has shared.
- Use actual line breaks instead of '\n' in your response to begin new lines.
- Use '\n' only when you want a literal backslash followed by a character 'n'.
- Always use English, even if I ask question in other languages. 
- For commit mssage, use Conventional Commit specification. For example, "feat(lang): add Klingon language"

When given a task:
- Think step-by-step and describe your plan for what to build in pseudocode, written out in great detail, unless asked not to do so.
- Output the code in a single code block, being careful to only return relevant code.
- You should always generate short suggestions for the next user turns that are relevant to the conversation.
- You can only give one reply for each conversation turn.

Additional guidelines for generating commit messages, merge request descriptions, and task descriptions:
- Be specific and factual: Clearly list which files and lines have changed, what exact modifications were made, and why they were necessary.
- Avoid generic or vague statements: Do not use phrases like “this improves consistency,” “enhances code quality,” or “makes the system more robust” unless you include precise details (e.g., identifying the bug, requirement, or measurable impact).
- Provide concrete justifications: Reference specific issues, bug IDs, or feature requirements that directly relate to the change.
- Focus on the impact: Describe the actual consequences of the change (for example, “centralizes the configuration to eliminate duplicate settings,” “fixes bug #123 by updating the API call,” or “removes redundant code that was causing performance issues”).
]]
end

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
      adapter = "openai",
      slash_commands = {
        ["file"] = { opts = { provider = "telescope" } },
        ["buffer"] = { opts = { provider = "telescope" } },
        ["symbols"] = { opts = { provider = "telescope" } },
      },
    },
    inline = { adapter = "openai" }
  },
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        schema = {
          model = {
            default = "o4-mini"
          }
        }
      })
    end,
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
  },
  opts = {
    system_prompt = system_prompt
  },
  display = {
    action_palette = {
      width = 50,
      height = 10,
      prompt = "Prompt ",                   -- Prompt used for interactive LLM calls
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
    },
    ["Generate a Commit Message"] = {
      strategy = "chat",
      description = "Generate a commit message",
      opts = {
        index = 2,
        is_default = false,
        is_slash_cmd = true,
        short_name = "commit",
        auto_submit = false,
      },
      prompts = {
        {
          role = constants.USER_ROLE,
          content = function()
            return fmt(
              [[
Please generate commit message for this changes:
```diff
%s
```
Additional context: %s
]],
              vim.fn.system("git diff --no-ext-diff --staged"),
              "\n"
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
    ["Generate a Merge Request"] = {
      strategy = "chat",
      description = "Generate a merge request",
      opts = {
        index = 3,
        is_default = false,
        is_slash_cmd = true,
        short_name = "mr",
        auto_submit = false,
      },
      prompts = {
        {
          role = constants.USER_ROLE,
          content = function()
            return fmt(
              [[
Please generate title and body for merge request. Base on this commits:
```
%s
```
Additional context: %s
]],
              vim.fn.system("git log @{u}..@"),
              "\n"
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
  }
})
