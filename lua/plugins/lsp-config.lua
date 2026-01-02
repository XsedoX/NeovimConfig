return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"omnisharp",
				"vue_ls",
				"ts_ls",
				"gopls",
				"html",
				"lua_ls",
				"stylua",
				"powershell_es",
			},
			automatic_enable = true,
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			{
				"neovim/nvim-lspconfig",
				config = function()
					vim.lsp.config("vue_ls", {
						filetypes = { "vue" },
					})

					vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { desc = "Hover documentation" })
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
					vim.keymap.set("n", "<leader>dg", vim.diagnostic.goto_next, { desc = "Expand diagnostics" })
				end,
			},
		},
	},
}
