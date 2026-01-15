LazyVim.on_very_lazy(function()
  vim.filetype.add({
    razor = "razor",
  })
end)
return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "cs", "vb", "fsharp", "razor" },
      root = {
        "*.sln",
        "*.csproj",
        "*.fsproj",
        "function.json",
        "paket.dependencies",
        "paket.lock",
        "*.slnx",
      },
    })
  end,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c_sharp", "fsharp", "razor" } },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.registries = opts.registries or {}
      -- Add the registry for Roslyn
      table.insert(opts.registries, 1, "github:mason-org/mason-registry")
      table.insert(opts.registries, 2, "github:Crashdummyy/mason-registry")

      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "roslyn")
      table.insert(opts.ensure_installed, "netcoredbg")
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {},
    dependencies = {
      "mason-org/mason.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        roslyn = {},
      },
    },
    setup = function(_, _)
      local mason_root = require("mason.settings").current.install_root_dir
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      if not dap.adapters["netcoredbg"] then
        require("dap").adapters["netcoredbg"] = {
          type = "executable",
          command = vim.fn.exepath("netcoredbg"),
          args = { "--interpreter=vscode" },
          options = {
            detached = false,
          },
        }
      end
      for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
        if not dap.configurations[lang] then
          dap.configurations[lang] = {
            {
              type = "netcoredbg",
              name = "Launch file",
              request = "launch",
              program = function()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "Issafalcon/neotest-dotnet",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {},
      },
    },
  },
  {
    "Issafalcon/neotest-dotnet",
    lazy = false,
    dependencies = {
      "nvim-neotest/neotest",
    },
  },
}
