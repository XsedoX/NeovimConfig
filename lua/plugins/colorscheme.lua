return {
  -- Add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    ---@type CatppuccinOptions
    opts = {
      -- You can customize flavour:  "latte", "frappe", "macchiato", "mocha"
      flavour = "mocha",
    },
  },

  -- Configure LazyVim to use catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
