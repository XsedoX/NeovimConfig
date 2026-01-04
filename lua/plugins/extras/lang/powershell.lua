return {
  desc = "PowerShell language support",
  recommended = function()
    return LazyVim.extras.wants({
      ft = "ps1",
      root = { "*. ps1", "*.psm1", "*.psd1", "PSScriptAnalyzerSettings.psd1" },
    })
  end,

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "powershell" } },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        powershell_es = {
          settings = {
            powershell = {
              codeFormatting = {
                preset = "OTBS", -- One True Brace Style
              },
            },
          },
        },
      },
    },
  },

  -- Mason - installs PowerShell Editor Services automatically
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "powershell-editor-services" } },
  },
}
