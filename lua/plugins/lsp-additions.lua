return {
  {
    "antosha417/nvim-lsp-file-operations",

    dependencies = {
      "nvim-neo-tree/neo-tree.nvim"
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          capabilities = {
            workspace = {
              fileOperations = {
                didRename = true,
                willRename = true,
              },
            },
          },
        },
      },
    },
  },
}
