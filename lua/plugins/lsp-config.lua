return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            auto_install = true,
        },
        dependencies = {
            {
                "mason-org/mason.nvim", 
                config = function()
                    require("mason").setup()
                end,
            },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    vim.lsp.enable("ts_ls")
                    vim.lsp.enable("html")
                    vim.lsp.enable("lua_ls")

                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, {})
                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
                end,
            },
        },
    }
}
