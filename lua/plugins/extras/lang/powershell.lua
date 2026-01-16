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
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        powershell_es = { enabled = false },
      },
    },
    setup = {
      powershell_es = function()
        return true
      end,
    },
  },
  -- PowerShell LSP and features
  {
    "TheLeoP/powershell.nvim",
    ft = { "ps1", "psm1", "psd1" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "mason-org/mason.nvim",
    },
    opts = {
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    },
    settings = {
      powershell = {
        enableProfileLoading = true,
      },
    },
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
        desc = "Run Selected Text",
      },
    },
  },
  -- Optional: DAP support for debugging
  {
    "mfussenegger/nvim-dap",
    optional = true,
  },
}
