return {
  -- 1. MCP Hub (Manages the Context7 Server)
  {
    "ravitemer/mcphub.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "bun install -g mcp-hub@latest",
    opts = {},
  },
  -- 2. CodeCompanion (The Chat Interface)
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    desc = "CodeCompanion AI Chat (Custom Extra)", -- Shows up in the LazyExtras menu
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      "mrjones2014/codecompanion-ui.nvim",
      {
        -- optional, but highly recommended
        -- `render-markdown.nvim` will auto-attach to lazy.nvim `ft` filetypes
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "codecompanion", "codecompanion_input" },
      },
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      extensions = {
        history = {
          enabled = true,
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = false,
            make_tools = true,
            show_server_tools_in_chat = true,
            show_result_in_chat = true,
          },
        },
        ui = {
          enabled = true,
        },
      },
      -- 1. Put the custom adapter inside the 'http' table!
      adapters = {
        http = {
          openrouter = function()
            return require("codecompanion.adapters").extend("openrouter", {
              name = "openrouter",
              schema = {
                model = {
                  default = "openrouter/free",
                },
              },
            })
          end,
        },
      },
      -- 2. Tell the plugin to use it (using the new interactions table)
      interactions = {
        background = { adapter = "openrouter" },
        inline = { adapter = "openrouter" },
        chat = {
          adapter = "openrouter",
          opts = {
            -- Pass a function to get the context and the default prompt
            system_prompt = function(ctx)
              local my_custom_guidance = [[
                Act as a senior programming mentor and teacher.
                1. When I ask for help, explain the underlying concepts, and outline the pros and cons of my choices,
                2. Give me hints or pseudocode or code samples to guide me in the right direction.
                3. Prioritize asking me guiding questions to help me arrive at the solution on my own.
                4. Try to stick to known code patterns like domain driven design, clean architecture, vertical slice, ports and adapters, etc., depending on a situation.
              ]]
              -- Combine the default prompt with your custom rules
              return ctx.default_system_prompt .. my_custom_guidance
            end,
          },
        },
        agent = {
          adapter = "openrouter",
          opts = {
            -- Pass a function to get the context and the default prompt
            system_prompt = function(ctx)
              local my_custom_guidance = [[
                Act as a senior programming mentor and teacher.
                1. When I ask for help, explain the underlying concepts, and outline the pros and cons of my choices,
                2. Give me hints or pseudocode or code samples to guide me in the right direction.
                3. Prioritize asking me guiding questions to help me arrive at the solution on my own.
                4. Try to stick to known code patterns like domain driven design, clean architecture, vertical slice, ports and adapters, etc., depending on a situation.
              ]]
              -- Combine the default prompt with your custom rules
              return ctx.default_system_prompt .. my_custom_guidance
            end,
          },
        },
      },
    },
    keys = {
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Chat" },
      { "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code to AI Chat" },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    },
  },
}
