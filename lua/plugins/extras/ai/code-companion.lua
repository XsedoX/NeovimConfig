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
        chat = { adapter = "openrouter" },
        agent = { adapter = "openrouter" },
      },
    },
    keys = {
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Chat" },
      { "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code to AI Chat" },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    },
  },
}
