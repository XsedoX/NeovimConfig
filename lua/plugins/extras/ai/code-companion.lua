return {
  -- 1. MCP Hub (Manages the Context7 Server)
  {
    "ravitemer/mcphub.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "bun install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end,
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
                  default = "qwen3-coder:30b",
                  choices = { "qwen3.5:4b", "qwen3.5:9b", "qwen3-coder:30b" },
                },
              },
            })
          end,
        },
      },
      -- 2. Tell the plugin to use it (using the new interactions table)
      interactions = {
        chat = { adapter = "qwen" },
        inline = { adapter = "qwen" },
        agent = { adapter = "qwen", tools = { "mcp" } },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_tools = true,
            show_server_tools_in_chat = true,
            show_result_in_chat = true,
          },
        },
      },
    },
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Chat" },
      { "<leader>ae", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code to AI Chat" },
    },
  },
}
