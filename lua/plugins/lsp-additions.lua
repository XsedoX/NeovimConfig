return {
  {
    "antosha417/nvim-lsp-file-operations",

    dependencies = {
      "nvim-neo-tree/neo-tree.nvim"
    },
    config = function()
      require("lsp-file-operations").setup({
        auto_save = true, 
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local file_ops_caps = require("lsp-file-operations").default_capabilities()
      opts.servers = opts.servers or {}
      opts.servers["*"] = opts.servers["*"] or {}
      opts.servers["*"].capabilities = vim.tbl_deep_extend(
        "force",
        opts.servers["*"].capabilities or {},
        file_ops_caps
      )
    end,
  },
}
