return {
  -- 1. MCP Hub (Manages the Context7 Server)
  {
    "ravitemer/mcphub.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "bun install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({ port = 37373 })
    end,
  },
  -- 2. CodeCompanion (The Chat Interface)
  {
    "olimorris/codecompanion.nvim",
    desc = "CodeCompanion AI Chat (Custom Extra)", -- Shows up in the LazyExtras menu
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
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
    },
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Chat" },
      { "<leader>ae", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code to AI Chat" },
    },
  },
}
