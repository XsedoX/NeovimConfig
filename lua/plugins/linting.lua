return {
	"mfussenegger/nvim-lint",
	config = function()
		vim.env.ESLINT_D_PPID = vim.fn.getpid()
		require("lint").linters_by_ft = {
			go = { "golangcilint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			cs = { "omnisharp" },
			lu = { "stylua" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
