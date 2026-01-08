return {
  desc = "PowerShell language support",
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "ps1", "psm1", "psd1" },
      root = { "*.ps1", "*.psm1", "*.psd1", ".git" },
    })
  end,

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "powershell" } },
  },

  -- Mason - installs PowerShell Editor Services automatically
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "powershell-editor-services" } },
  },
  -- PowerShell LSP and features
  {
    "TheLeoP/powershell.nvim",
    opts = function()
      return {
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
      }
    end,
    keys = {
      {
        "<leader>cP",
        function()
          require("powershell").toggle_term()
        end,
        ft = { "ps1", "psm1", "psd1" },
        desc = "Toggle PowerShell Terminal",
      },
      {
        "<leader>cE",
        function()
          require("powershell").eval()
        end,
        mode = { "n", "x" },
        ft = { "ps1", "psm1", "psd1" },
        desc = "Eval PowerShell Expression",
      },
    },
  },

  -- Optional: DAP support for debugging
  {
    "mfussenegger/nvim-dap",
    optional = true,
  },
}
