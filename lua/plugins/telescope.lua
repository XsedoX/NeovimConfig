return {
    {
    "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },

            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "Live grep"})
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {desc = "Recent files"})

            require("telescope").load_extension("ui-select")
          end,
    }
}
