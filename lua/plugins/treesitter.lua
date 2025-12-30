return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy=false,
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {}, -- Add specific parsers here or use "all"
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                indent = {
                    enable = true,
                },
            })
        end
    }
}


