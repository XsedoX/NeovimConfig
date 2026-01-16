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
    config = function(_, opts)
      local powershell = require("powershell")
      powershell.setup(opts)
      local ps_util = require("powershell.util")

      -- FIX A: Manually overwrite DAP adapter to remove -NoProfile
      local dap = require("dap")
      dap.adapters.ps1 = function(on_config)
        local bundle_path = opts.bundle_path
        local shell = "pwsh"
        local file = bundle_path .. "/PowerShellEditorServices/Start-EditorServices.ps1"
        local log_file_path = vim.fn.stdpath("cache") .. "/powershell_es.dap.log"
        local session_file_path = vim.fn.stdpath("cache") .. "/powershell_es.session.json"

        -- HACK:workaournd to load profie
        local ps_command = string.format(
          "if ($PROFILE.CurrentUserAllHosts -and (Test-Path -Path $PROFILE.CurrentUserAllHosts)) { . $PROFILE.CurrentUserAllHosts }; & '%s' -HostName nvim -HostProfileId Neovim -HostVersion 1.0.0 -LogPath '%s' -LogLevel Warning -DebugServiceOnly -SessionDetailsPath '%s'",
          file,
          log_file_path,
          session_file_path
        )
        -- Construct command WITHOUT "-NoProfile"
        local cmd = {
          shell,
          "-NoLogo",
          "-NoProfile",
          "-NonInteractive",
          "-Command",
          ps_command,
        }

        vim.system(cmd)

        -- Wait for the session file to initialize
        ps_util.wait_for_session_file(session_file_path, function(details, err)
          if err then
            return vim.notify(err, vim.log.levels.ERROR)
          end
          on_config({
            type = "pipe",
            pipe = details.debugServicePipeName,
          })
        end)
      end
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
        desc = "Run Selected Text",
      },
    },
  },
}
