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
      "xinghe98/codecompanion-model-selector.nvim",
    },
    opts = {
      extensions = {
        model_selector = {
          opts = {
            default_adapter = "openrouter",
            adapters = {
              openrouter = {
                base = "openrouter",
                env = {
                  url = "https://openrouter.ai/api/v1",
                  api_ket = os.getenv("OPENROUTER_API_KEY"),
                  chat_url = "/chat/completions",
                },
                default = "openrouter/free",
                choices = { "openrouter/free", "minimax/minimax-m3", "openrouter/pareto-code" },
              },
              copilot = {
                base = "copilot",
              },
            },
          },
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
      -- 2. Tell the plugin to use it (using the new interactions table)
      interactions = {
        background = { adapter = "openrouter", model = "openrouter/free" },
        inline = { adapter = "openrouter", model = "openrouter/free" },
        chat = { adapter = "openrouter" },
        agent = { adapter = "openrouter", model = "minimax/minimax-m3" },
      },
    },
    keys = {
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Chat" },
      { "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code to AI Chat" },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
      { "<leader>am", "<cmd>CCSelectModel<cr>", desc = "CodeCompanion Model Selection" },
    },
  },
}
