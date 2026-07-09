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
    },
    opts = {
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = false,
            make_tools = true,
            show_server_tools_in_chat = true,
            show_result_in_chat = true,
          },
        },
      },
      -- 1. Put the custom adapter inside the 'http' table!
      adapters = {
        http = {
          qwen = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "qwen",
              env = {
                url = "http://192.168.122.1:11434",
              },
              schema = {
                model = {
                  default = "qwen3.5:9b",
                  choices = { "qwen3.5:4b", "qwen3.5:9b", "qwen3-coder:30b" },
                },
              },
            })
          end,
          openrouter = function()
            return require("codecompanion.adapters").extend("openrouter", {
              name = "openrouter",
              schema = {
                model = {
                  default = "nvidia/nemotron-3-super-120b-a12b:free",
                },
              },
            })
          end,
        },
      },
      -- 2. Tell the plugin to use it (using the new interactions table)
      interactions = {
        background = { adapter = "qwen", model = "qwen3.5:4b" },
        inline = { adapter = "qwen", model = "qwen3.5:9b" },
        chat = { adapter = "openrouter" },
        agent = { adapter = "openrouter", model = "minimax/minimax-m3" },
      },
    },
    keys = {
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Chat" },
      { "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code to AI Chat" },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    },
  },
}
